class ApplicationController < ActionController::Base
    private
    # redirect to home page after signing out
    def after_sign_out_path_for(resource_or_scope)
        root_path
    end
    def after_sign_in_path_for(resource_or_scope)
        root_path
    end
end
