class Api::V1::BeachesController < ApplicationController

    def index
        beaches = Beach.all

        render json: beaches
    end

    def show
        beach = Beach.first

        render json: beach
    end
end
