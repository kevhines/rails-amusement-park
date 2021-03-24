class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find_by_id(params[:id])

        @ride = Ride.new(user_id: current_user.id, attraction_id: @attraction.id)
    end

    def new
        @attraction = Attraction.new
    end

    def edit

        @attraction = Attraction.find_by_id(params[:id])
    end

    def create 
        att = Attraction.create(attraction_params)
        redirect_to attraction_path(att)
    end

    def update
        att = Attraction.find_by_id(params[:id])
        att.update(attraction_params)

        redirect_to attraction_path(att)
    end

    private
    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
      end
end
