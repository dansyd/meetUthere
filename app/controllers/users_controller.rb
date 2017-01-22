class UsersController < ApplicationController
  before_action :check_if_logged_in, :only => [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id #going back to
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    # check_if_logged_in
    @user = @current_user
  end

  def update
    user = @current_user
    user.update user_params
    redirect_to edit_user_path(user.id)
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :dob, :sex)
  end
end