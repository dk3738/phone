class HomeController < ApplicationController
  skip_before_action :login_user
  def index
    @companies = Company.all.order(created_at: :desc).limit(5)
    @onlines = Online.all.order(created_at: :desc).limit(5)
    @frees = Free.all.order(created_at: :desc).limit(5)
    @shares = Share.all.order(created_at: :desc).limit(5)
    @reviews = Review.all.order(created_at: :desc).limit(4)
  end
  
  def show
    
  end
end
