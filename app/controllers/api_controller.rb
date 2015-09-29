class ApiController < ApplicationController
  # No action on this controller is accessible without a
  # supplying a valid token.
  before_filter :verify_jwt_token

  protected

  def verify_jwt_token
    head :unauthorized if request.headers['Authorization'].nil? ||
        !AuthToken.valid?(request.headers['Authorization'].split(' ').last)
  end

end