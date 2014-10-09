class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have signed up successfully"
      session[:remember_token] = @user.id.to_s
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(user_params)
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "User profile has been updated"
        redirect_to users_path
      else
        render 'edit'
      end
  end

  protected
  def user_params
    params.require(:user).permit(:name, :email, :zip, :password, :password_confirmation)
  end
end
