class ApplicationController < ActionController::Base
    include ApplicationHelper
    add_flash_types :danger, :info, :warning, :success

    def authorize?
        if !logged_in?
            flash[:danger] = 'Must Be Logged In For This Action'
            redirect_back(fallback_location: root_path)
        end
    end

    
end
