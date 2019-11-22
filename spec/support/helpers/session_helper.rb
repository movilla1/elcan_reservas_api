# frozen_string_literal: true

module SessionHelper
  def assemble_request_headers(resp)
    {
      'ACCEPT' => 'application/json',
      'Content-Type' => 'application/json',
      'Authentication' => resp['authentication_token']
    }
  end

  def api_login(data)
    request_params = {
      'username' => data[:username],
      'password' => data[:password]
    }
    post '/authentication/authenticate', params: request_params
    assemble_request_headers(response.headers)
  end
end
