class Api::V1::FavoriteBuoysController < ApplicationController
    before_action :find_favorite_buoys, only: [:index, :destroy]
    before_action :find_buoy, only: [:create]


    def index        
        render json: @favorite_buoys
    end

    #TODO:
        # if user references beach and it does not exist in database, create Beach.create and associate it to the buoy with BuoyBeach.create
        # if named/nearest beach does not exist in database, create below
    def create
        favorite_buoy = current_user.favorite_buoys.build(buoy_id: @buoy.id)
        favorite_buoy.save

        render json: favorite_buoy
    end

    def destroy
        favorite_buoy = @favorite_buoys.find_by(buoy_id: params[:id])
        
        if favorite_buoy.destroy
            render json: { success: "Successfully deleted" }, status: :accepted

        else
            render json: { error: "Failed to delete" }, status: :not_acceptable
        end
    end

    
    private

    def find_favorite_buoys
        @favorite_buoys = current_user.favorite_buoys 
    end

    def find_buoy
        @buoy = Buoy.find(params[:id])
    end
end
