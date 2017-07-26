class HomeController < ApplicationController

  def index
    @ads = Ad.all.where(status: :active)
  end

end
