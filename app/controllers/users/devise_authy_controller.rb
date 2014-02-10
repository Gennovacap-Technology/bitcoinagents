class Users::DeviseAuthyController < Devise::DeviseAuthyController

	def POST_enable_authy
		@authy_user = Authy::API.register_user(
			:email => resource.email,
			:cellphone => params[:cellphone],
			:country_code => params[:country_code]
		)

		if @authy_user.ok?
			resource.authy_id = @authy_user.id
			resource.phone = params[:country_code] + params[:cellphone]
			if resource.save
				set_flash_message(:notice, :enabled)
			else
				set_flash_message(:error, :not_enabled)
				redirect_to after_authy_enabled_path_for(resource) and return
			end

			redirect_to [resource_name, :verify_authy_installation]
		else
			set_flash_message(:error, :not_enabled)
			render :enable_authy
		end
	end

	protected

	def after_authy_enabled_path_for(resource)
      dashboard_path
    end

    def after_authy_verified_path_for(resource)
      dashboard_path
    end

end