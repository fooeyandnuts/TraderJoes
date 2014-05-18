class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(:email => params[:session][:email]).first

    if @user == nil || !@user.authenticate(params[:session][:password])
      flash[:error] = "Invalid email/password combination"
      render 'new'
    else
      session[:remember_token] = @user.id
      @current_user = @user
      flash[:success] = "Shopping List!"
        redirect_to lists_path
    end

  end

  def destroy
    session.delete(:remember_token)
    redirect_to users_path
  end

end
