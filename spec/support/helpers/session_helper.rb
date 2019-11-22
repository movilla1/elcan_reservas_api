# frozen_string_literal: true

module SessionHelper
  def assemble_request_headers(resp)
    {
      'ACCEPT' => 'application/json',
      'Content-Type' => 'application/json',
      'Authorization' => resp['auth_token']
    }
  end

  def api_login(data)
    request_params = {
      'username' => data[:username],
      'password' => data[:password]
    }
    post '/login', params: request_params
    assemble_request_headers(response.headers)
  end
end
