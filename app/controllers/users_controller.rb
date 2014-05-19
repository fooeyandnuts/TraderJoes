class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have signed up successfully"
      redirect_to :root
    else
      render :new
    end
  end

  def view
  end

  def edit

  end

  def update
    if @user = User.update(user_params)
      flash[:success] = "User profile has been updated"
      redirect_to users_path
    else
      render "edit"
    end
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :zip, :password)
  end
end
