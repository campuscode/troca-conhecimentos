class ProposalMailer < ApplicationMailer

  def notify_proposal_accepted(proposal)

    @ad = proposal.ad
    @user = proposal.user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Parabens! Sua proposta foi aceita!')
  end

  def notify_new_proposal(ad)
    @ad = ad
    mail(to: @ad.user.email, subject: 'Você recebeu uma nova proposta')
  end
end
