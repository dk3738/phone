class FreesController < InheritedResources::Base
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_free, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  
  def index
    @frees = Free.all.order("created_at DESC").page params[:page]
  end

  def show
    @new_comment  = Comment.build_from(@free, current_user.id, "")
    @free.increment!(:view_count)
  end

  def edit
  end

  def create
    @free = Free.new(free_params)
    @free.user = current_user

    respond_to do |format|
      if @free.save
        format.html { redirect_to @free, notice: 'Free was successfully created.' }
        format.json { render :show, status: :created, location: @free }
      else
        format.html { render :new }
        format.json { render json: @free.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @free.update(free_params)
        format.html { redirect_to @free, notice: 'Free was successfully updated.' }
        format.json { render :show, status: :ok, location: @free }
      else
        format.html { render :edit }
        format.json { render json: @free.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    
    def set_free
      @free = Free.find(params[:id])
    end

    def free_params
      params.require(:free).permit(:title, :description, images: [])
    end
    
    def check_owner
      redirect_to root_path unless @free.user == current_user
    end

end
