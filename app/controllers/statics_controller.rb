class StaticsController < ApplicationController
    helper StaticsHelper
    
    def home
        if params[:query]
            @stays = Property.search(params[:query])
        end
        
    end
end
