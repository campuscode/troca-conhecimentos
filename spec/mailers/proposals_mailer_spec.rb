require 'rails_helper'

RSpec.describe ProposalMailer do
  describe 'Notify when recive a new purposal' do
    it 'successfully' do
      owner = User.create(email: 'teste1@mail.com', password: '123456')
      ad = create(:ad, user: owner)
      create(:profile, user: owner)
      mail = ProposalMailer.notify_new_proposal(ad)

      expect(mail.subject).to eq 'Você recebeu uma nova proposta'
      expect(mail.body).to include ad.requested_knowledge
      expect(mail.body).to include ad.offered_knowledge
      expect(mail.body).to include ad.meeting_type
      expect(mail.body).to include ad.day_period
      expect(mail.body).to include ad.location
      expect(mail.body).to include ad.avaliability
    end
  end
end
