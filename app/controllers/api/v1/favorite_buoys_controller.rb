class Api::V1::FavoriteBuoysController < ApplicationController
    skip_before_action :authorized
    before_action :find_favorite_buoys, only: [:index]


    def index        
        render json: @favorite_buoys
    end

    #TODO:
        # if user references beach and it does not exist in database, create Beach.create and associate it to the buoy with BuoyBeach.create
        # if named/nearest beach does not exist in database, create below
    def create

    end

    
    private

    def find_favorite_buoys
        @favorite_buoys = User.first.favorite_buoys 
    end
end
