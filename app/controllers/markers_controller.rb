class MarkersController < ApplicationController
    # BUILD - CREATE/UPDATE/DELETE


    def create
        marker = Marker.create(marker_params)
        render json: marker
    end

    def update
        marker = Marker.find(params[:id])
        marker.update(marker_params)
        render json: marker
    end

    def destroy
        marker = Marker.find(params[:id])
        marker.destroy
        render json: marker
    end

    private
    def marker_params
        params.require(:marker).permit(:title, :notes, :accomplished, :user_group_goal_id)
    end

end
