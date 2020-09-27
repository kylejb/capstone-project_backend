class Api::V1::FavoriteBeachesController < ApplicationController
    before_action :find_favorite_beaches, only: [:index]


    def index        
        render json: @favorite_beaches
    end

    #TODO:
        # user adds beach and/or location to favorites
        # if named/nearest beach does not exist in database, create below
    def create

    end

    
    private

    def find_favorite_beaches
        @favorite_beaches = current_user.favorite_beaches 
    end
end
