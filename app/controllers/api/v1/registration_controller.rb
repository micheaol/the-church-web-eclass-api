class Api::V1::RegistrationController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            render json: {user: @user, status: "success"}, status: :created
        else
            render json: {error: @user.errors}
        end
    end


    private
    def user_params
        params.permit(:email, :password, :password_confirmation)
    end
end
