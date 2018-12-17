class ApplicationController < ActionController::Base
    before_action :authenticate_user! # before any action make sure user is authenticated
end
