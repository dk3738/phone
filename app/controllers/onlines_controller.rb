class OnlinesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_online, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  # GET /onlines
  # GET /onlines.json
  def index
    @onlines = Online.all.order("created_at DESC").page params[:page]
  end

  # GET /onlines/1
  # GET /onlines/1.json
  def show
      @online.increment!(:view_count)
  end

  # GET /onlines/new
  def new
    @online = Online.new
  end

  # GET /onlines/1/edit
  def edit
  end

  # POST /onlines
  # POST /onlines.json
  def create
    @online = Online.new(online_params)
    @online.user = current_user

    respond_to do |format|
      if @online.save
        format.html { redirect_to @online, notice: 'Online was successfully created.' }
        format.json { render :show, status: :created, location: @online }
      else
        format.html { render :new }
        format.json { render json: @online.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /onlines/1
  # PATCH/PUT /onlines/1.json
  def update
    respond_to do |format|
      if @online.update(online_params)
        format.html { redirect_to @online, notice: 'Online was successfully updated.' }
        format.json { render :show, status: :ok, location: @online }
      else
        format.html { render :edit }
        format.json { render json: @online.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /onlines/1
  # DELETE /onlines/1.json
  def destroy
    @online.destroy
    respond_to do |format|
      format.html { redirect_to onlines_url, notice: 'Online was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_online
      @online = Online.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def online_params
      params.require(:online).permit(:title, :description, images: [])
    end

    def check_owner
      redirect_to root_path unless @online.user == current_user
    end
    
end
