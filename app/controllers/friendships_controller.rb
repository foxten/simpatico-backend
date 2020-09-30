class FriendshipsController < ApplicationController
    # BUILD - DELETE
    skip_before_action :authorized

    def show 
        friendship = Friendship.find(params[:id])
        render json: friendship
    end

    def create
        friendship = Friendship.new
        if Friendship.find_by(friend_a_id: friendship_params[:friend_a_id], friend_b_id: friendship_params[:friend_b_id]) || Friendship.find_by(friend_a_id: friendship_params[:friend_b_id], friend_b_id: friendship_params[:friend_a_id])
            render json: { message: 'Friendship already exists' }
        else
            friendship = Friendship.create(friendship_params)
            render json: friendship
        end
    end

    def destroy
        friendship = Friendship.find(params[:id])
        friendship.destroy
        render json: friendship
    end

    private
    def friendship_params
        params.require(:friendship).permit(:friend_a_id, :friend_b_id)
    end
end
