class UserGroupGoalsController < ApplicationController
    # BUILD - CREATE/UPDATE/DELETE

    skip_before_action :authorized, only: [:create]

    def create
        ugg = UserGroupGoal.create(ugg_params)
        render json: ugg
    end

    def update
        ugg = UserGroupGoal.find(params[:id])
        ugg.update(ugg_params)
        render json: ugg
    end

    def destroy
        ugg = UserGroupGoal.find(params[:id])
        ugg.destroy
        render json: ugg
    end

    private
    def ugg_params
        params.require(:user_group_goal).permit(:user_id, :goal_id)
    end
end
