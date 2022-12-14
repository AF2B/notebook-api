class V1::UsersController < ApplicationController
  include Jwt::AuthenticateUserModule

  def create
    @user = User.create(user_params)

    if @user.valid?
      @token = Jwt::EncodeDecodeToken.encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
