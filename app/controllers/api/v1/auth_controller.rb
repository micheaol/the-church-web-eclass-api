class Api::V1::AuthController < ApplicationController
    def login
        user = User.find_by(email: params[:email])

        if (user && user.authenticate(params[:password]))
            render json: {user: user, message: "Login successfull"}
        else
            render json: { error: "Wrong email address or password"}
        end
    end
end
