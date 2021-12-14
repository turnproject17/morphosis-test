class ::Api::V1::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, raise: false
  skip_before_action :verify_signed_out_user
  prepend_before_action :require_no_authentication, only: [:create]
  include Devise::Controllers::Helpers

   before_action :ensure_params_exist

  def create
    resource = User.find_for_database_authentication(email: params[:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:password])
      jwt = Auth.issue({user: resource.id})
      render json: {  
        success: true,
        authorization: {
          access_token: jwt,
          type: 'Bearer'
        }
      }
    end
  end

  def destroy
    sign_out(resource_name)
  end

  protected
    def ensure_params_exist
      return unless params[:email].blank?
      render(json: {success: false, message: "missing email parameter"}, status: 422)
      return unless params[:password].blank?
      render(json: {success: false, message: "missing password parameter"}, status: 422)
    end

    def invalid_login_attempt
      warden.custom_failure!
      render(json: {success: false, message: "Error with your login or password"}, status: 401)
    end

  private

    def create_params
      params.permit(:email, :password)
    end
end