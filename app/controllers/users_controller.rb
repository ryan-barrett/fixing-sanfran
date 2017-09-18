class UsersController < ApplicationController

  def index
  end

  def new
    # we make a new user
    # to pass to the form view later
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    login(@user) # <-- log the user in
    redirect_to home_path # <-- go to show
  end

  def show
    @user = User.find_by_id(params[:id])
  end



  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :password)
  end

end
