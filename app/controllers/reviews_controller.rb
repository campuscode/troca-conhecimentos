class ReviewsController < ApplicationController

  def new
    @profile = Profile.find params[:profile_id]
    @profile_review = @profile.reviews.new
  end

  def create

  end
end
