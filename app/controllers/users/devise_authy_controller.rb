class Users::DeviseAuthyController < Devise::DeviseAuthyController

	protected

	def after_authy_enabled_path_for(resource)
      dashboard_path
    end

    def after_authy_verified_path_for(resource)
      dashboard_path
    end

end