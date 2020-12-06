class ComcommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        new_comcomment = Comcomment.new(content: params[:content], company_id: params[:company_id], user_id: current_user.id)
        new_comcomment.save
        redirect_back(fallback_location: root_path)
    end

    def destroy
        comcomment = Comcomment.find_by(id: params[:id])
        comcomment.destroy
        redirect_back(fallback_location: root_path)
    end
end
