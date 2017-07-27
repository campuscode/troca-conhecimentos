class AdsController < ApplicationController

before_action :authenticate_user!, only: [:create, :new]

  def index
    @ads = current_user.ads
  end

  def show
    @ad = Ad.find(params[:id])
    @current_user_proposal = @ad.proposals.find_by(user: current_user)
  end

  def new
    if current_user.ads.where(status: :active).any?
       flash[:notice] = 'Voce ja tem um anuncio ativo'
       redirect_to root_path
    else
      @ad = Ad.new
    end
  end

  def create
    @ad = Ad.create(ad_params)
    @ad.user = current_user
    @ad.save
    redirect_to @ad
  end

  def filter
    @busca = params[:filter]
    @ads = Ad.active.where("requested_knowledge like ? or offered_knowledge like ?", "%#{@busca}%", "%#{@busca}%")
  end

  def finish
    @ad = Ad.find(params[:ad_id])
    @ad.finish!
    redirect_to @ad
  end

  private

    def ad_params
      params.require(:ad).permit( :requested_knowledge, :offered_knowledge, :meeting_type,
                                  :day_period, :location, :avaliability)
    end



end
