class Api::V1::BeachesController < ApplicationController

    def index
        beaches = Beach.all

        render json: beaches.as_json(except: [:buoys])
    end

    def show
        beach = Beach.find(params[:id])

        render json: beach
    end
end
