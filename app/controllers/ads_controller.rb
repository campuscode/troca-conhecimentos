class AdsController < ApplicationController

    def new
      @ad = Ad.new
    end

    def create
      @ad = Ad.create(ad_params)
      if @ad.save
      redirect_to @ad
      end
    end

    def show
     @ad = Ad.find(params[:id])
    end

private

     def ad_params
       params.require(:ad).permit(:requested_knowledge, :offered_knowledge,
                                  :meeting_type, :day_period, :location, :avaliability)          
     end
end
