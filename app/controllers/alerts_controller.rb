class AlertsController < ApplicationController
    skip_before_action :authorized
    
    def index
        alerts = Alert.all
        render json: alerts
    end

    def show
        alert = Alert.find(params[:id])
        render json: alert
    end

    def create
        alert = Alert.create(alert_params)
        render json: alert
    end

    def destroy
        alert = Alert.find(params[:id])
        alert.destroy
    end

    private
    def alert_params
        params.require(:user_group_goal).permit(:user_id, :goal_id)
    end

end
