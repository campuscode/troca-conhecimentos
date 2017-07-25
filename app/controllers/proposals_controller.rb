class ProposalsController < ApplicationController
    before_action :authenticate_user!, only: [:new]
    before_action :find_ad, only: [:create, :new, :show]

    def show
        @proposal = @ad.proposals.find(params[:id])
    end

    def new
        @proposal = @ad.proposals.new
    end

    def create
        @proposal = @ad.proposals.new(proposal_params)
        @proposal.user = current_user
        if @proposal.save
            redirect_to [@ad, @proposal]
        else
            flash[:error] = 'Houve um erro'
            render :new
        end
    end

    def my_proposals
      @proposals = current_user.my_proposals
    end

    def approve
      
    end

private
    def find_ad
      @ad = Ad.find(params[:id])
    end

    def proposal_params
        params.require(:proposal).permit(:description, :requested_knowledge, :email, :day_period, :meeting_type)
    end
end
