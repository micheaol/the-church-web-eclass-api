class Api::V1::RegistrationController < ApplicationController
    before_action :authorize_request, except: :create
    before_action :find_user, except: %i[create index]

    
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
