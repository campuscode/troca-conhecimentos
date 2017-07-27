class ProposalsMailer < ApplicationMailer

  def notify_new_proposal(ad)
    @ad = ad
    mail(to: @ad.user.email, subject: 'Você recebeu uma nova proposta')
  end
end
