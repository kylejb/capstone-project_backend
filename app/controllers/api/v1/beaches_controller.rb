class Api::V1::BeachesController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    
    def index
        beaches = Beach.all

        render json: beaches
    end

    def show
        beach = Beach.find(params[:id])

        render json: beach
    end
end
