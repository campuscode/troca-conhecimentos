class HomeController < ApplicationController

  def index
    @ads = Ad.all
    
  end

end
