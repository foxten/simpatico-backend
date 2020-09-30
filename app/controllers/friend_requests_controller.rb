class FriendRequestsController < ApplicationController
    # BUILD - NEW/CREATE/DELETE
    skip_before_action :authorized

    def index
        friend_requests = FriendRequests.all
        render json: friend_requests
    end

    def create
        friend_request = FriendRequest.new
        if FriendRequest.find_by(requestor_id: current_user.id, requestee_id: fr_params[:requestee_id]) || FriendRequest.find_by(requestor_id: fr_params[:requestor_id], requestee_id: current_user.id )
            render json: {message: "Friend Request Pending"}
        else
            friend_request = FriendRequest.create(fr_params)
            Alert.create(user_id: friend_request.requestee_id, message: "#{current_user.first_name} would like to be friends!", alertable: friend_request)
            render json: friend_request
        end
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
