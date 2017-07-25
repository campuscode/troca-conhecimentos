class HomeController < ApplicationController

  def index
    @ads = Ad.all
    @proposals = Proposal.all
  end
  
end
