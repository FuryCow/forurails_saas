# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ::ActionController::Caching
  self.cache_store = :redis_store

  before_action :authenticate_owner_request
  attr_reader :current_owner

  private

  def authenticate_owner_request
    auth = AuthorizeOwnerApiRequest.call(request.headers)
    @current_owner = auth.result
    errors = auth.errors.to_h[:token]&.first
    render json: { error: 'not_authorized', full_message: errors }, status: :unauthorized unless @current_owner
  end
end
