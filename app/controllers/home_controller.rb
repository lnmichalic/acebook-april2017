class HomeController < ApplicationController
  def index
    if signed_in?
      redirect_to('/posts')
    else
      redirect_to('/sign_up')
    end
  end
end
