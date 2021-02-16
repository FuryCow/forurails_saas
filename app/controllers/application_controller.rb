# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ::ActionController::Caching
  self.cache_store = :redis_store
end
