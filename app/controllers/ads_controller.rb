class AdsController < ApplicationController

  def filter
    @busca=params[:filter]
    @ads = Ad.where("requested_knowledge like  ?  ", "%#{@busca}%")
  end

end
