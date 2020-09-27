class Api::V1::BeachesController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    
    def index
        beaches = Beach.all

        render json: beaches
    end

    def show
        beach = ( params[:id] ? Beach.find(params[:id]) : Entry.find(params[:entry_id]).beach )

        render json: beach
    end
end
