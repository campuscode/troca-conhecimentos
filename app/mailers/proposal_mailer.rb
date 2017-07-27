class ProposalMailer < ApplicationMailer

  def notify_proposal_accepted(proposal)

    @ad = proposal.ad
    @user = proposal.user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Parabens! Sua proposta foi aceita!')
  end
end
