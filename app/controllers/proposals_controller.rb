class ProposalsController < ApplicationController

    def show
    end 

    def new
        @proposal = Proposal.new
    end 

    def create
        @proposal = Proposal.create(proposals_params)
        @proposal.user = current_user
        if @proposal.save
            redirect_to @proposal
        else
            flash[:error] = 'Houve um erro'
            render :new    
        end    
    end 


private 

    def proposals_params
        params.require(:proposal).permit(:description, :requested_knowledge, :email, :day_period, :meeting_type)
    end 
end    
