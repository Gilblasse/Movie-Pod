class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(new_user_params)
        @user.profile = Guest.new
        @user.save 
        session[:current_user_id] = @user.id

        redirect_to user_path @user
    end

    def login_form
    end


    def login 
        @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

        if @user
            if @user.save
                session[:current_user_id] = @user.id
                redirect_to user_path @user
            else
                render :login_form
            end
        else 
            redirect_to '/login', danger: "User Does Not Exist Please"
        end
    end

    def destroy
        session.delete :current_user_id 
        redirect_to '/'
    end



    
    private 
    
    def new_user_params
        params.require(:user).permit(:name,:email,:password)
    end

end

