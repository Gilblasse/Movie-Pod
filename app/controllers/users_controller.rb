class UsersController < ApplicationController
    before_action :authorize?, only: [:show]

    def index
    end

    def show
        @user = User.find(params[:id])
    end

    
    

    
    
    private 
    
    def user_params
        params.require(:user).permit(:name,:avatar,:password)
    end
end
