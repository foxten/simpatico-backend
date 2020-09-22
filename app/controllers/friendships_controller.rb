class FriendshipsController < ApplicationController
    # BUILD - DELETE
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
