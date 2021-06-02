module Api
  class ApiController < ActionController::Base
    skip_before_action :verify_authenticity_token

    before_action :set_default_response_format
    before_action :authenticate, if: -> { Rails.configuration.should_protect_api }

    protected

    def authenticate
      auth || unauth
    end

    def auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['API_USERNAME'] && password == ENV['API_PASSWORD']
      end
    end

    def unauth
      render file: 'public/404.html', status: :unauthorized
    end

    def set_default_response_format
      request.format = :json unless params[:format]
    end
  end
end
