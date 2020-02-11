class ApplicationController < ActionController::Base
    helper ApplicationHelper
    add_flash_types :danger, :info, :warning, :success
end
