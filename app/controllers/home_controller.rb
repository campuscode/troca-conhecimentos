class HomeController < ApplicationController

  def index
    @ads = Ad.all
    @proposal = Proposal.all
  end
  
end
