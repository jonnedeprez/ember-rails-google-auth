class Api::UsersController < ApiController

  def index
    respond_with User.all
  end

end
