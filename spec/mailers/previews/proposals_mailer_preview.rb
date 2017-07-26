class ProposalsMailerPreview < ActionMailer::Preview
  def notify_new_proposal
    ad = Ad.first
    owner = User.first
    owner = User.create(email: 'teste@mail.com', password: '123456') if owner.nil?
    if ad.nil?
      ad = Ad.create(requested_knowledge: 'Violão', offered_knowledge: 'Programação', meeting_type: 'Presencial', day_period: 'Diurno',
                      location: 'Na livraria cultura', avaliability: 'Sabados', user: owner)
    end
    ProposalsMailer.notify_new_proposal(ad)
  end
end
