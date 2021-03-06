class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:user_name, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = 'Successfully logged in.' # <--- Add this flash notice
      redirect_to root_path
    else
      flash[:error] = 'Incorrect username or password.' # <--- Add this flash error
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Successfully logged out.' # <--- Add this flash notice
    redirect_to root_path
  end
end
