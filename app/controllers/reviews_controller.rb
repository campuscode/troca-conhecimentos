class ReviewsController < ApplicationController

  def new
    @profile = Profile.find params[:profile_id]
    @profile_review = @profile.profile_reviews.new
  end

  def create
    @profile = Profile.find params[:profile_id]
    @profile_review = @profile.profile_reviews.new(profile_review_params)
    @profile_review.user = current_user
    @profile_review.save
    redirect_to @profile
  end

  private

  def profile_review_params
    params.require(:profile_review).permit(:rating, :comment)
  end


end
