class SessionsController < ApplicationController

    def signup_form
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:current_user_id] = @user.id
            redirect_to root_path
        else
            render :signup_form  
        end
    end


    def login_form
        @user = User.new
    end


    def login 
        if user_params[:username].empty? || user_params[:password].empty?
            @user = User.new(user_params)
            render :login_form if !@user.valid?

        elsif @user = User.find_by(username: user_params[:username]).try(:authenticate, user_params[:password])
            session[:current_user_id] = @user.id
            redirect_to root_path, success: "Welcome #{@user.username} you've been successfully Logged in"
        else
            redirect_to login_path, danger: 'Incorrect Password or Username'
        end
    end

    def ominauth
        username = auth['info']['email'].split('@').first.split('.').first.capitalize
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = username
            u.password = SecureRandom.base64(15)
        end
        session[:current_user_id] = @user.id
        redirect_to root_path, success: "Welcome #{@user.username} you've been successfully Logged in"
    end

    def destroy
        @user = current_user
        session.delete :current_user_id 
        flash[:success] = "GoodBye #{@user.username} you've successfully Logged Out"
        redirect_back(fallback_location: root_path)
    end









    
    private 
    
    def user_params
        params.require(:user).permit(:username, :password)
    end

    def auth
        request.env['omniauth.auth']
    end

end

