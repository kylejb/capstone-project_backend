class Api::V1::FavoriteBeachesController < ApplicationController

    def index
        favorite_beaches = current_user.favorite_beaches
        
        render json: favorite_beaches
    end

    def show
        favorite_beach = current_user.favorite_beaches.find(params[:id])
        
        render json: favorite_beach
    end
end
