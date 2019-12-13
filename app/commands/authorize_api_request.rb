class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    @user ||= Usuario.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @role = @user.role
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    unless headers['Authorization'].present?
      errors.add(:token, 'Missing token')
      return false
    end
    headers['Authorization'].split(' ').last
  end
end
