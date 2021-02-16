# frozen_string_literal: true

class AuthenticateOwner
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(owner_id: owner.id) if owner
  end

  private

  attr_accessor :email, :password

  def owner
    owner = Owner.find_by_email(email)
    return owner if owner&.authenticate(password)

    errors.add :owner_authentication, 'invalid credentials'
  end
end
