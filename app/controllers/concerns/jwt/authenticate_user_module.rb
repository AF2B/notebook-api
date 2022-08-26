# module with methods jwt to encode and decode token
module Jwt
  module AuthenticateUserModule
    extend ActiveSupport::Concern
    include Jwt::EncodeDecodeToken
    include Jwt::AuthenticateUser

    included do
      before_action :authenticate_user
    end

    private

    def authenticate_user; end

    def encode_token(payload)
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end
  end
end
