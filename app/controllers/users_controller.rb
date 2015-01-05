class UsersController < ApplicationController
  skip_before_filter :logged_in, only: [:new, :create]
  def index
  end

  def new
    @user = User.new
  end

  def show
    if current_user
      @user = User.find(session[:current_user])
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'The User is successfully saved!'
      session[:current_user] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit
    @user = User.find(session[:current_user])
  end

  def update
    @user = User.find(session[:current_user])
    if @user.update(params.require(:user).permit(:name, :email))
      redirect_to user_path(session[:current_user])
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end
end
