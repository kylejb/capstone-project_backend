class Api::V1::BuoysController < ApplicationController

    def index
        buoys = Buoy.all

        render json: buoys
    end

end
