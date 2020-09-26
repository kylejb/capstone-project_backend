class Api::V1::BuoysController < ApplicationController

    # temp for testing
    skip_before_action :authorized

    def index
        buoys = Buoy.all

        render json: buoys
    end

    def show
        buoy = Buoy.find(params[:id])

        render json: buoy.to_json(:include => :meteorological_data)
    end
end
