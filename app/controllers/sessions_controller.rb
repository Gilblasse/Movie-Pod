class SessionsController < ApplicationController

    def signup_form
        @user = User.new
    end

    def create
        @user = User.new(new_user_params)
        new_user_profile
        @user.save 
        session[:current_user_id] = @user.id
        redirect_to user_path @user
    end


    def login_form
    end


    def login 
        @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
        if @user 
            session[:current_user_id] = @user.id
            if @user.profile_type == "Guest" && !!params[:type]
                new_user_type
            end 
            redirect_to  appropriate_path
        else 
            redirect_to login_path
        end
    end


    def ominauth
        binding.pry
    end


    def destroy
        session.delete :current_user_id 
        redirect_to '/'
    end









    
    private 
    
    def new_user_params
        params.require(:user).permit(:name,:email,:password)
    end

    def auth
        request.env['omniauth.auth']
    end

    def appropriate_path
        binding.pry
        if @user.profile_type == "Guest"
            root_path
        else
            host_path @user
        end
    end

    def new_user_profile
        profile_type = params[:user][:profile].split('-').last.capitalize.safe_constantize
        if  profile_type
            @user.profile =  profile_type.new
        else  
            @user.profile =  Guest.new
        end
    end

    def new_user_type
        profile_type = params[:type].split('-').last.capitalize.safe_constantize

        if  !!profile_type
            guest_id = @user.profile_id
            @user.update(profile: profile_type.create)
            @user.profile.update(guest_profile_id: guest_id)
        else  
            redirect_to login_path
        end
    end

end

