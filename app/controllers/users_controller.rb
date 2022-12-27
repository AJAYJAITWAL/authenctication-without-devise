class UsersController < ApplicationController
  def new; end

  def index
    @users = User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "Signup successfully"
      session[:user_id] = user.id
      redirect_to users_path
    else
      flash[:notice] = "Please try again"
      redirect_to new_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
