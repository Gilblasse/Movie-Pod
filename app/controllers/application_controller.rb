class ApplicationController < ActionController::Base
    include ApplicationHelper
    add_flash_types :danger, :info, :warning, :success

    
end
