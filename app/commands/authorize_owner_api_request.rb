# frozen_string_literal: true

class AuthorizeOwnerApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    owner
  end

  private

  attr_accessor :headers

  def owner
    @owner ||= Owner.find(decoded_auth_token[:owner_id]) if decoded_auth_token
    @owner || errors.add(:token, 'Invalid or expired token')
  end

  def decoded_auth_token
    if headers['Authorization'].present?
      http_auth_header = headers['Authorization'].split(' ').last
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    else
      errors.add(:token, 'Missing token')
    end
  end
end
