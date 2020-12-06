class ReviewcommentsController < InheritedResources::Base
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    new_reviewcomment = Reviewcomment.new(content: params[:content], review_id: params[:review_id], user_id: current_user.id)
    new_reviewcomment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    reviewcomment = Reviewcomment.find_by(id: params[:id])
    reviewcomment.destroy
    redirect_back(fallback_location: root_path)
  end
end
