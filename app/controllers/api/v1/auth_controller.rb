class Api::V1::AuthController < ApplicationController
    before_action :authorize_request, except: :login

    def login
        user = User.find_by(email: params[:email])

        if (user && user.authenticate(params[:password]))
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            render json: {token: token, exp: time.strftime("%m-%d-%Y %H:%M"), user: user, message: "Login successfull", status: "success"}, status: :ok
        else
            render json: { error: "Wrong email address or password", message: "Login failed"}
        end
    end

    private

    def login_params
        params.permit(:email, :password)
    end
end
