class AuthController < ApplicationController
    skip_before_action :authorized

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
        else
            render json: {message: 'Invalid username or password'}, status: :unauthorized
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

