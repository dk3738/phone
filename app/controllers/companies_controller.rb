class CompaniesController < InheritedResources::Base
  before_action :authenticate_user!, only: [:create, :new, :update, :edit, :destroy]
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @companies = Company.all.order("created_at DESC").page params[:page]
  end

  def show
    @new_comment  = Comment.build_from(@company, current_user.id, "")
    @company.increment!(:view)
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:title, :description, images: [])
    end

    def check_owner
      redirect_to root_path unless @company.user == current_user
    end

end
