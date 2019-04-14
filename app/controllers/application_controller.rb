class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName, :username, :cpf, :street, :number, :complement, :neighborhood, :city, :state, :postalCode])
        devise_parameter_sanitizer.permit(:account_update, keys: [:firstName, :lastName, :username, :cpf, :street, :number, :complement, :neighborhood, :city, :state, :postalCode])

    end
    
    def after_sign_out_path_for(resource_or_scope)
      #did not find any other successful way to reset session
      session[:cart] = []
      root_path
    end
  
end
