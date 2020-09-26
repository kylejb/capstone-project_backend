class Api::V1::EntriesController < ApplicationController

    def index
        entries = current_user.entries

        render json: entries.to_json(:except => :buoys)
    end

    def show
        entry = current_user.entries.find(params[:id])
        
        render json: entry
    end

    def create
        # new_entry = current_user.entries.build(entry_params)
        datetime_s = params[:entry][:session_start_time]
        date_s, time_s = datetime_s.split("T")
        date_a = date_s.split('-')
        time_a = time_s.split(':')

        new_entry = Entry.new(beach: Beach.find(params[:entry][:beach_id]), user: current_user, session_start_time: DateTime.new(date_a[0].to_i, date_a[1].to_i, date_a[2].to_i, time_a[0].to_i, time_a[1].to_i))
        new_entry.save
        new_entry.update(entry_params)

        render json: new_entry
    end

    def update
        revised_entry = Entry.find(params[:id])
        revised_entry.update(entry_params)
        render json: revised_entry
    end

    def destroy
        entry = Entry.find(params[:id])
        if entry.destroy
            render json: { success: 'deleted entry' }, status: :accepted
        else
            render json: { error: 'failed to delete entry' }, status: :not_acceptable
        end
    end

    
    private

    def entry_params
        params.require(:entry).permit(:beach_id, :session_duration, :entry, :wave_quality, :session_start_time)
    end
end
