# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper Webpacker::Helper
  include SessionsHelper
  protect_from_forgery with: :exception
  before_action :set_request_variant
  before_action :site_http_basic_authenticate_with

  unless Rails.env.development?
    rescue_from Exception,                        with: :render_500
    rescue_from ActiveHash::RecordNotFound,       with: :render_404
    rescue_from ActiveRecord::RecordNotFound,     with: :render_404
    rescue_from ActionController::RoutingError,   with: :render_404
  end

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  def exception_error
    raise Exception, params[:path]
  end

  private

  def site_http_basic_authenticate_with
    return if ENV["BASIC_AUTH_NAME"].blank? || ENV["BASIC_AUTH_PASSWORD"].blank?
    return unless use_basic_auth_env?

    authenticate_or_request_with_http_basic("Application") do |name, password|
      name == ENV["BASIC_AUTH_NAME"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def use_basic_auth_env?
    %i[staging review_app].include?(Rails.env.to_sym)
  end

  def render_404(_error = nil)
    render template: "errors/not_found", status: :not_found, layout: "application", content_type: "text/html"
  end

  def render_500(_error = nil)
    render template: "errors/exception", status: :internal_server_error, layout: "application", content_type: "text/html"
  end

  def logged_in_check
    return if logged_in?

    redirect_to signin_path
  end

  def set_request_variant
    request.variant = request.device_variant
  end

  def remote_ip
    @remote_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
  end

  def user_agent
    request.user_agent
  end
end
