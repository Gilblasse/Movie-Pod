class HostsController < ApplicationController

    def show
        if host.properties.empty?
            redirect_to new_host_property_path host
        end
    end






    private 

    def host
        current_user.profile
    end
    
end
