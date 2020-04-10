class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
		case resource
			when Admin
			admin_root_path
			when Customer
			customer_path(current_customer)
		end
	end
	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :is_deleted])
		end
end
