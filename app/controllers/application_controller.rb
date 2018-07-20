class ApplicationController < ActionController::Base
    private
    def after_sign_up_path_for(resource)
        new_profile_path(resource)
    end
    def after_inactive_sign_up_path_for(resources)
        new_profile_path(resource)
    end
end
