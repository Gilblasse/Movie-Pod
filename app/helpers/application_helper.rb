module ApplicationHelper

    def dynamic_navlinks 
        render partial: "statics/navbar"
    end

    def logged_in?
        !!session[:current_user_id]
    end

    def current_user
        @current_user ||= User.find(session[:current_user_id]) if logged_in?
    end


end
