class HomeController < ApplicationController
  skip_before_filter :logged_in, only: [:show]
  
  def show
  end
end
