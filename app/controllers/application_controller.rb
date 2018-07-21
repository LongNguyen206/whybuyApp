class ApplicationController < ActionController::Base
    private
    
    def after_sign_in_path_for(resource)
        if admin_signed_in?
            admin_home_path
        elsif current_user.profile.nil?
            new_profile_path
        else
            root_path
        end
    end
end
