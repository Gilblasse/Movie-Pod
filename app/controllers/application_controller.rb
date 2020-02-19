class ApplicationController < ActionController::Base
    include ApplicationHelper
    add_flash_types :danger, :info, :warning, :success

    def authorize?
        user_id = params[:user_id] || params[:id]
        if !logged_in?
            flash[:danger] = 'Must Be Logged In For This Action'
            redirect_back(fallback_location: root_path)
        elsif current_user != User.find_by(id: user_id)
            flash[:danger] = 'Acess Prohibited'
            redirect_back(fallback_location: root_path)
        end
    end

    
end
