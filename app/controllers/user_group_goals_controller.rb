class UserGroupGoalsController < ApplicationController
    # BUILD - CREATE/UPDATE/DELETE

    skip_before_action :authorized, only: [:create]

    def create
        ugg = UserGroupGoal.new
        if UserGroupGoal.find_by(user_id: ugg_params[:user_id], goal_id: ugg_params[:goal_id])
            render json: { message: "User Goal already exists" }
        else
            ugg = UserGroupGoal.create(ugg_params)
                # if ugg.goal.multi_user == true
                    Alert.create(user_id: ugg.user_id, message: "#{current_user.first_name} has created a new shared goal. ", alertable: ugg)
                # end
            render json: ugg
        end
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
