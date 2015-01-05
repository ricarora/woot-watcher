class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create
  skip_before_filter :logged_in, only: [:create, :new, :user]

  def new

  end

  def create
    if user && user.authenticate(params[:user][:password])
      session[:current_user] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_path
  end

  private
  def user
      User.find_by(username: params[:user][:username])
  end
end
