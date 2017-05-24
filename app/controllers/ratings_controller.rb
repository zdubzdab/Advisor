class RatingsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      render nothing: true, status: :ok
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:score, :user_id, :hotel_id)
  end
end
