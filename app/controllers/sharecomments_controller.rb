class SharecommentsController < InheritedResources::Base
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    new_sharecomment = Sharecomment.new(share_id: params[:share_id], content: params[:content], user_id: current_user.id)
    new_sharecomment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    sharecomment = Sharecomment.find_by(id: params[:id])
    sharecomment.def destroy
    redirect_back(fallback_location: root_path)
  end
end
