# frozen_string_literal: true

module Api
  class ApiController < ActionController::Base
    skip_before_action :verify_authenticity_token

    rescue_from StandardError, with: :rescue_500
    rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :rescue_404

    before_action :set_default_response_format
    before_action :authenticate, if: -> { Rails.configuration.should_protect_api }

    def rescue_404
      render plain: '404 - Not Found', status: :not_found
    end

    def rescue_500(ex)
      log_exception(ex) if ex
      render plain: '500 - Server Error', status: :internal_server_error
    end

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

    def log_exception(ex)
      logger.error(
        JSON(
          event: 'ApiException',
          exception: ex.class,
          exception_message: ex.message,
          backtrace: ex.backtrace
        )
      )
    end
  end
end
