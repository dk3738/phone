class ReviewsController < InheritedResources::Base
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  
  def index
    @reviews = Review.all
    @reviews = Review.order("created_at DESC").page params[:page]
  end

  def show
    @review.increment!(:view_count)
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:title, :description, images: [])
    end
    
    def check_owner
      redirect_to root_path unless @review.user == current_user
    end
    
end
