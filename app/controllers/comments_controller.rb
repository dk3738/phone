class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        new_comment = Comment.new(body: params[:body], online_id: params[:online_id], user_id: current_user.id)
        new_comment.save
        redirect_back(fallback_location: root_path)
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        comment.destroy
        redirect_back(fallback_location: root_path)
    end
end
