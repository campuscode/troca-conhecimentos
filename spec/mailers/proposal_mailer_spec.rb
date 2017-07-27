require 'rails_helper'

RSpec.describe ProposalMailer do
  describe "#notify_proposal_accepted" do

    it "create the mail correctly" do
      user = create(:user, email: 'joao@campuscode.com.br')
      profile = create(:profile, name: 'Joao', user: user)
      owner = create(:user, email: 'owner@teste.com')
      ad = create(:ad, title: 'Urgente, aprender alemão!', user: owner)
      proposal = create(:proposal, ad: ad, user: user, status: :approved)


      mail = ProposalMailer.notify_proposal_accepted(proposal)

      expect(mail.to).to include 'joao@campuscode.com.br'
      expect(mail.subject).to eq 'Parabens! Sua proposta foi aceita!'
      expect(mail.body).to include 'Parabens! Sua proposta foi aceita!'
      expect(mail.body).to include 'voce cadastrou uma proposta para o anuncio'
      expect(mail.body).to include 'para ver a sua proposta, clique :'
    end
  end
end
