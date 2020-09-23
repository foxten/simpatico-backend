class GoalsController < ApplicationController
    # BUILD - NEW/CREATE/EDIT/UPDATE/DELETE
    skip_before_action :authorized 
    def show
        goal = Goal.find(params[:id])
        render json: goal
    end
    # BUILD - NEW/CREATE/EDIT/UPDATE/DELETE
    
    def create
        goal = Goal.create(goal_params)
        UserGroupGoal.create(goal_id: goal.id, user_id: current_user.id)
        render json: goal
    end

    def update
        goal = Goal.find(params[:id])
        goal.update(goal_params)
        render json: goal
    end

    def destroy
        goal = Goal.find(params[:id])
        goal.destroy
        render json: goal
    end

    private
    def goal_params
        params.require(:goal).permit(:title, :deadline, :publicly_viewable, :multi_user)
    end
end
