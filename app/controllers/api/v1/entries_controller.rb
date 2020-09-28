class Api::V1::EntriesController < ApplicationController
    before_action :find_entry, except: [:index, :create]

    def index
        entries = current_user.entries

        render json: entries
    end

    def show
        render json: @entry
    end

    def create
        # new_entry = current_user.entries.build(entry_params)
        datetime_s = params[:entry][:session_start_time]
        date_s, time_s = datetime_s.split("T")
        date_a = date_s.split('-')
        time_a = time_s.split(':')

        # refactor once frontend design for form is completed and enable mass assignment through strong_params; resolve date formatting and the optional beach params (will need to create new Beach if it doesn't exist)
        #! this controller will be hit when BEACH is not passed; entry_beach WILL be hit when beach is passed through (and does not exist in DB?)
        new_entry = Entry.new(buoy_id: params[:entry][:buoy_id], beach_id: Beach.find(params[:entry][:beach_id]), user: current_user, session_start_time: DateTime.new(date_a[0].to_i, date_a[1].to_i, date_a[2].to_i, time_a[0].to_i, time_a[1].to_i))
        new_entry.save
        new_entry.update(entry_params)

        render json: new_entry
    end

    def update
        @entry.update(entry_params)
        render json: revised_entry
    end

    def destroy
        if @entry.destroy
            render json: { success: 'deleted entry' }, status: :accepted
        else
            render json: { error: 'failed to delete entry' }, status: :not_acceptable
        end
    end

    
    private

    def entry_params
        params.require(:entry).permit(:session_duration, :entry, :wave_quality, :session_start_time, :buoy_id, :beach_id)
    end

    def find_entry
        @entry = Entry.find(params[:id])
    end
end
