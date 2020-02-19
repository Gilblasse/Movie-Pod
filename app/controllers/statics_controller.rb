class StaticsController < ApplicationController
    helper StaticsHelper
    
    def home
        if params[:query]
            # @stays = Property.search(params[:query])
        end
        
    end

    def error 
        status_code = params[:code] || 500
        flash.alert = "Sorry Page Does Not Exist Error: #{status_code}"
        redirect root_path
    end
end
