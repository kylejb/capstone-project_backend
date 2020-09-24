class Api::V1::FavoriteBeachesController < ApplicationController
    skip_before_action :authorized

    def index
        favorite_beaches = User.first.favorite_beaches
        
        render json: favorite_beaches
    end

    def show
        favorite_beach = User.first.favorite_beaches.find(params[:id])
        
        render json: favorite_beach
    end
end
