class AdsController < ApplicationController

  def filter
    @busca=params[:filter]
    @ads = Ad.where("requested_knowledge like  ? or offered_knowledge like  ? ", "%#{@busca}%", "%#{@busca}%")
  end

end
