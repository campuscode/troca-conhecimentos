class ProposalsController < ApplicationController
  before_action :authenticate_user!, only: %i[new]
  before_action :find_ad, only: %i[create new show]

  def show
    @proposal = Proposal.find(params[:id])
  end

  def new
    @proposal = @ad.proposals.new
  end

  def create
    @proposal = @ad.proposals.new(proposal_params)
    @proposal.user = current_user
    if @proposal.save
      ProposalMailer.notify_new_proposal(@ad).deliver_now
      redirect_to @ad
    else
      flash[:error] = 'Houve um erro'
      render :new
    end
  end

  def my_proposals
    @proposals = current_user.my_proposals.where(status: :pending)
  end

    def approve
      @proposal = Proposal.find(params[:id])
      @proposal.approved!

      flash[:notice] = 'Proposta aceita com sucesso.'
      ProposalMailer.notify_proposal_accepted(@proposal).deliver_now
      redirect_to my_proposals_path
    end

  private

  def find_ad
    @ad = Ad.find(params[:ad_id])
  end

  def proposal_params
    params.require(:proposal).permit(:description, :requested_knowledge,
                                     :email, :day_period, :meeting_type)
  end
end
