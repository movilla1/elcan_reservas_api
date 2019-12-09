# frozen_string_literal: true

module SessionHelper
  def assemble_request_headers(resp)
    {
      "ACCEPT" => "application/json",
      "HTTP_ACCEPT" => "application/json",
      "Authorization" => resp["auth_token"]
    }
  end

  def api_login(data)
    request_params = {
      "username" => data[:username],
      "password" => data[:password]
    }
    post "/login", params: request_params
    begin
      assemble_request_headers(JSON.parse(response.body))
    rescue JSON::ParserError
      return false
    end
  end
end
