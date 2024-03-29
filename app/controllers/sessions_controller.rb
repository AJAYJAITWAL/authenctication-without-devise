class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Login successfully"
      redirect_to root_path
    else
      flash[:notice] = "Invalid email or password"
      redirect_to '/login'
    end
  end

    def destroy
      session[:user_id] = nil
      flash[:notice] = "Logged Out successfully"
      redirect_to '/login'
    end
end
