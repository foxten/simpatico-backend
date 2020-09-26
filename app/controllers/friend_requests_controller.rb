class FriendRequestsController < ApplicationController
    # BUILD - NEW/CREATE/DELETE
    skip_before_action :authorized

    def index
        friend_requests = FriendRequest.all
        render json: friend_requests
    end

    def create
        friend_request = FriendRequest.create(fr_params)
        Alert.create(user_id: friend_request.requestee_id, message: "#{current_user.first_name} would like to be friends!", alertable: friend_request)
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
