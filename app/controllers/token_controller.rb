require 'google/apis/oauth2_v2'
require 'auth_token'

class TokenController < ApplicationController

  def create

    access_token = create_params['password']
    provider = create_params['provider']

    user_info = {}

    case provider
      when 'google'
        user_info = google_user_info(access_token)
      when 'facebook'
        user_info = facebook_userinfo(access_token)
      else
        render status: :unauthorized
    end

    @user = User.where(uid: "#{user_info[:uid]}", provider: user_info[:provider]).first_or_create do |user|
      user.uid = user_info[:uid]
      user.email = user_info[:email]
      user.name = user_info[:name]
      user.provider = user_info[:provider]
    end

    token = AuthToken.issue_token(user_id: @user.id)

    render json: {
               user_id: @user.id,
               user_email: @user.email,
               token: token
           }
  end


  def refresh
    oldtoken = refresh_params
    decoded_token = AuthToken.valid?(oldtoken)

    if !!decoded_token
      render json: {token: AuthToken.issue_token(user_id: decoded_token.first['user_id'])}, status: :ok
    else
      render status: :unauthorized
    end
  end

  private

  def create_params
    params.require(:token).permit(:password, :provider)
  end

  def refresh_params
    params.require(:token)
  end

  def google_user_info(access_token)
    service = Google::Apis::Oauth2V2::Oauth2Service.new
    service.authorization = Signet::OAuth2::Client.new(access_token: access_token)
    user_info = service.get_userinfo_v2

    # Available fields:
    # email, family_name, gender, given_name, id, link, locale, name, picture, verified_email

    return {uid: user_info.id, email: user_info.email, name: user_info.name, provider: 'google'}
  end

  def facebook_userinfo(access_token)
    graph = Koala::Facebook::API.new(access_token)
    user_info = graph.get_object('me')

    Rails.logger.info(user_info.inspect)

    return {uid: user_info['id'], name: user_info['name'], provider: 'facebook'}
  end



end
