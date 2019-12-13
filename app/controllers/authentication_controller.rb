# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:username], params[:password])

    if command.success?
      render json: { auth_token: command.result[0], role: command.result[1] },
             status: :ok
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
