# frozen_string_literal: true

class JsonWebToken
  class << self
    def encode(payload, exp = 1.minutes.from_now)
      payload['exp'] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    rescue StandardError
      puts "Invalid or expired token: #{token}"
    end
  end
end
