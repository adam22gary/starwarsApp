class ApplicationController < ActionController::Base
    #sends to path after logout button
    private
    def after_sign_out_path_for(resources_or_scope)
        new_user_session_path
    end
end
