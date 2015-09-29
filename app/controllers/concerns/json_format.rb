module JsonFormat
  extend ActiveSupport::Concern

  included do
    respond_to :json

    before_action :default_json
  end

  # for the given article/event returns the first comment
  def default_json
    request.format = :json if params[:format].nil?
  end

end