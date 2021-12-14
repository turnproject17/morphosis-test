class Api::V1::ApplicationController < ActionController::API
  # include Response
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  respond_to :json

  before_action :authenticate

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def logged_in?
    !!current_user
  end

  def current_user
    if auth_present?
      user = User.find(auth["user"])
      if user
        @current_user ||= user
      end
    end
  end

  def authenticate
    render json: {success: false, error: "Unauthorized"}, status: 401 unless logged_in?
  end

  def default_serializer_options
    {root: false}
  end

  def api_exception_handler(exception)
    @errors = []
    @errors << exception.message
    @response[:code] = 0
  end

  def content_type
    "application/vnd.api+json"
  end

  def render_serialized_payload(status = 200)
    render json: yield, status: status, content_type: content_type
  rescue ArgumentError => exception
    render_error_payload(exception.message, 400)
  end

  def render_serialized_collection_payload(serializer, status = 200)
    render json: yield, each_serializer: serializer, status: status, content_type: content_type
  rescue ArgumentError => exception
    render_error_payload(exception.message, 400)
  end

  def render_error_payload(error, status = 422)
    if error.is_a?(Struct)
      render json: { error: error.to_s, errors: error.to_h }, status: status, content_type: content_type
    elsif error.is_a?(String)
      render json: { error: error }, status: status, content_type: content_type
    end
  end

  private

    def token
      request.env["HTTP_AUTHORIZATION"].scan(/Bearer (.*)$/).flatten.last
    end

    def auth
      Auth.decode(token)
    end

    def auth_present?
      !!request.env.fetch("HTTP_AUTHORIZATION", "").scan(/Bearer/).flatten.first
    end

    def record_not_found
      render json: { success: false, message: 'Resource not found.' }
    end

    def current_order
      @current_order = current_user.orders.incomplete.first_or_create
    end
end 