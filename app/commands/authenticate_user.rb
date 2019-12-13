class AuthenticateUser
  prepend SimpleCommand

  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    [JsonWebToken.encode(user_id: user.id, role: user.rol), user.rol] if user
  end

  private

  attr_accessor :username, :password

  def user
    user = Usuario.find_by(username: username) if username.present?
    return user if user.present? && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
