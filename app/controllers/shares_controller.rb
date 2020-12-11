class SharesController < InheritedResources::Base
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_share, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  
  def index
    @shares = Share.all
    @shares = Share.order("created_at DESC").page params[:page]
  end

  def show
    @new_comment  = Comment.build_from(@share, current_user.id, "")
    @share.increment!(:view_count)
  end

  def edit
  end

  def create
    @share = Share.new(share_params)
    @share.user = current_user

    respond_to do |format|
      if @share.save
        format.html { redirect_to @share, notice: 'Share was successfully created.' }
        format.json { render :show, status: :created, location: @share }
      else
        format.html { render :new }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @share.update(share_params)
        format.html { redirect_to @share, notice: 'Share was successfully updated.' }
        format.json { render :show, status: :ok, location: @share }
      else
        format.html { render :edit }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    
    def set_share
      @share = Share.find(params[:id])
    end

    def share_params
      params.require(:share).permit(:title, :description, images: [])
    end
    
    def check_owner
      redirect_to root_path unless @share.user == current_user
    end

end
