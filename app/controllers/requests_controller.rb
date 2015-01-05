class RequestsController < ApplicationController
  def index
    @request = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(params.require(:request).permit(:website, :stringmatch))
    @request.user_id = session[:current_user]
    if @request.save
      flash[:notice] = 'The request is successfully saved!'
      redirect_to user_path(session[:current_user])
    else
      render :new
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(params.require(:request).permit(:website, :stringmatch))
      redirect_to user_path(session[:current_user])
    else
      render :edit
    end
  end

  def destroy
    Request.find(params[:id]).destroy
    redirect_to user_path(session[:current_user])
  end
end
