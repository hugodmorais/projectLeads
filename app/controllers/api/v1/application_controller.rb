class Api::V1::ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :restrict_access

  private

  def restrict_access
    authenticate_or_request_with_http_token do |token, _options|
      app_token = 'hsqucKZm3UkDDLb7xdmSSwhm'

      app_token.present? && app_token == token
    end
  end
end
