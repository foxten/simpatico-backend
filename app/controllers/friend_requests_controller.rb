class FriendRequestsController < ApplicationController
    # BUILD - NEW/CREATE/DELETE

    def create
        friend_request = FriendRequest.create(fr_params)
        render json: friend_request
    end

    def destroy
        friend_request = FriendRequest.find(params[:id])
        friend_request.destroy
        render json: friend_request
    end

    private
    def fr_params
        params.require(:friend_request).permit(:requestor_id, :requestee_id)
    end
end
