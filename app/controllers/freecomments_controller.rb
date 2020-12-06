class FreecommentsController < InheritedResources::Base
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    new_freecomment = Freecomment.new(free_id: params[:free_id], body: params[:body], user_id: current_user.id)
    new_freecomment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    freecomment = Freecomment.find_by(id: params[:id])
    freecomment.destroy
    redirect_back(fallback_location: root_path)    
  end
end
