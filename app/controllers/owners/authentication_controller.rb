# frozen_string_literal: true

module Owners
  class AuthenticationController < ApplicationController
    skip_before_action :authenticate_owner_request

    def authenticate
      command = AuthenticateOwner.call(params[:email], params[:password])

      if command.success?
        render json: {auth_token: command.result }
      else
        render json: {errors: command.errors }, status: :unauthorized
      end
    end
  end
end