require 'rails_helper'

feature 'User receive a mail' do
  scenario 'after proposal accepted' do
    user = create(:user)
    profile = create(:profile, name: 'Rogerio bispo', user: user)
    owner = create(:user, email: 'owner@teste.com')
    ad = create(:ad, title: 'Urgente, aprender alemão!', user: owner, active: true)

    proposal = create(:proposal, ad: ad, user: user)
    proposal.pending!

    login_as owner
    visit root_path

    click_on 'Propostas recebidas'

    expect(ProposalMailer).to receive(:notify_proposal_accepted).with(proposal).and_call_original

    click_on 'Aceitar'
  end
end
