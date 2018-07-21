class ApplicationController < ActionController::Base
    private
    
    def after_sign_in_path_for(resource)
        # prompt user to create profile is they don't have one after logging in
        if user_signed_in? && current_user.profile.nil?
            new_profile_path
        # this 'else' condition allows both users with profiles to land on user home page and admins to land on admin home page
        else
            root_path
        end
    end
end
