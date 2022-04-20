class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true, :format => { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, message: "Please enter a valid email address" }
    has_secure_password
end
