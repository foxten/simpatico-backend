class UsersController < ApplicationController
    skip_before_action :authorized

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def index
        @users = User.all
        render json: @users.to_json(:only => [:id, :first_name, :last_initial, :username]) 
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user
    end


    private
    def user_params
        params.require(:user).permit(:username, :first_name, :last_initial, :password, :email_address)
    end
end

