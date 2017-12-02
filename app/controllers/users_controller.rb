class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Holy Mackerel!"
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:alert] = "There seems to be an error in signing up."
      redirect_to '/signup'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
  
