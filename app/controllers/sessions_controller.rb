class SessionsController < ApplicationController
  respond_to :html

  attr_accessor :email, :password

  def new
  end

  def create
    user = authenticate_session(session_params)
    sign_in(user) or set_flash_message
    respond_with user, location: root_path

    # @user = User.find_by(email: params[:user][:email])
    # if @user && @user.authenticate(params[:user][:password])
    #   session[:user_id] = @user.id
    #   redirect_to root_path
    # else
    #   @user = User.new(email: params[:user][:email])
    #   @user.errors[:base] << "Username / password is invalid"
    #   render :new
    # end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def set_flash_message
    flash.now.notice = "Invalid username or password"
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end

