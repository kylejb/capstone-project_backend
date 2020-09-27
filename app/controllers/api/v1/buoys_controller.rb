class Api::V1::BuoysController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def index
        buoys = Buoy.all

        render json: buoys, exclude: [:meteorological_data]
    end

    def beach_buoys_index
        beach_buoys = Entry.find(params[:entry_id]).beach.buoys

        render json: beach_buoys, exclude: [:meteorological_data]
    end

    def show
        buoy = Buoy.find(params[:id])

        render json: buoy, include: [:meteorological_data]
    end
end
