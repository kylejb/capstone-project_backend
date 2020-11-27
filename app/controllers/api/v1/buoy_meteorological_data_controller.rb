class Api::V1::BuoyMeteorologicalDataController < ApplicationController
    skip_before_action :authorized, only: [:index]

    # currently limited to latest five reports; should the generation of reports be user triggered?
    def index
        meteorological_data = Buoy.find(params[:buoy_id]).meteorological_data.order('recorded_data_at DESC')[2..6]

        render json: meteorological_data
    end
end
