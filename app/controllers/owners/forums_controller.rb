# frozen_string_literal: true

module Owners
  class ForumsController < ApplicationController
    def forums_list
      forums = @current_owner.forums.to_json
      render json: {forums_list: forums }
    end
  end
end