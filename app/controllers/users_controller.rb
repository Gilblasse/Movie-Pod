class UsersController < ApplicationController
    
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
