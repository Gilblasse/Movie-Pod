class PropertiesController < ApplicationController
    include PropertiesHelper


    def new
        @host = Host.find_by_id(params[:host_id])
        @property = @host.properties.build
    end

    def create
        if current_user.profile_type == "Host"
            property = current_user.profile.properties.build(property_params)
            if property.save 
                redirect_to host_path(property.host), success: "Your Property Was Successfully Added"
            else 
                render :new
            end
        end
    end

    






    private 
    
    def property_params
        params.require(:property).permit(:title,:classification,:description,:capacity,:beds,:bathrooms,:address,:city,:state,:zip,:images => [],:amenities => [] )
    end
end

