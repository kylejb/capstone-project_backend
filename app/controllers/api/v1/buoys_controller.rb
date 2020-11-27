class Api::V1::BuoysController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    before_action :find_buoy, except: [:index]

    def index
        buoys = Buoy.all

        render json: buoys
    end

    def show
        render json: @buoy.as_json(:include => :entries)
    end


    private

    def find_buoy
        @buoy = Buoy.find(params[:id])
    end
end
