class Api::V1::EntryBeachController < ApplicationController
    before_action :find_beach, except: [:create]

    def show
        render json: @beach
    end

    def create
        # use .build to create beach through entry
        byebug
    end


    private

    def find_beach
        @beach = Entry.find(params[:entry_id]).beach
    end
end
