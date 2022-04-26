class Api::V1::AuthController < ApplicationController
    def login
        user = User.find_by(email: params[:email])

        if (user && user.authenticate(params[:password]))
            render json: {user: user, message: "Login successfull", status: "success"}, status: :ok
        else
            render json: { error: "Wrong email address or password", message: "Login failed"}
        end
    end
end
