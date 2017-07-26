require 'rails_helper'

RSpec.describe ProposalsMailer do

  describe 'Notify when recive a new purposal' do

      it 'successfully' do
        owner = User.create(email: 'teste1@mail.com', password: '123456')
        ad = Ad.create(requested_knowledge: 'Aprender a tocar guitarra', offered_knowledge: 'Programação', meeting_type: 'Presencial', day_period: 'Diurno',
                        location: 'Na livraria cultura', avaliability: 'Sabados', user: owner)

        mail = ProposalsMailer.notify_new_proposal(ad)

        expect(mail.subject).to eq 'Você recebeu uma nova proposta'
        expect(mail.body).to include 'Aprender a tocar guitarra'
        expect(mail.body).to include 'Programação'
        expect(mail.body).to include 'Presencial'
        expect(mail.body).to include 'Diurno'
        expect(mail.body).to include 'Na livraria cultura'
        expect(mail.body).to include 'Sabados'

      end
  end

end
