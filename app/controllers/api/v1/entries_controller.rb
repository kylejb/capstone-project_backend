class Api::V1::EntriesController < ApplicationController
    skip_before_action :authorized

    def index
        entries = current_user.entries
        
        render json: entries
    end

    def show
        entry = current_user.entries.find(params[:id])
        
        render json: entry
    end
end
