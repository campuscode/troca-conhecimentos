require 'rails_helper'
feature 'user list his proposals' do
  scenario 'successfully' do
    #dados
    user = create(:user)
    login_as(user)
    ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')
    proposal = create(:proposal, user: user, ad: ad, description: 'Sei tocar violao',
                      requested_knowledge: 'Quero aprender a cozinhar', email: 'eliza@teste.com',
                      day_period: 'Manha', meeting_type: 'Online')
    proposal.approved!

    other_ad = create(:ad, requested_knowledge: 'Quero aprender Java')
    other_proposal = create(:proposal, user: user, ad: ad, description: 'Sei tocar violao',
                      requested_knowledge: 'Quero aprender a cozinhar', email: 'eliza@teste.com',
                      day_period: 'Manha', meeting_type: 'Online')
    other_proposal.pending!
    #acao do usuario
    visit root_path

    click_on 'Minhas propostas'

    expect(page).to have_css('h1', text: 'Suas propostas:')
    expect(page).to have_css('dl', text: proposal.requested_knowledge)
    expect(page).to have_css('dl', text: proposal.offered_knowledge)
    expect(page).to have_css('dl', text: 'Email')
    expect(page).to have_css('dl', text: proposal.day_period)
    expect(page).to have_css('dl', text: proposal.meeting_type)
    expect(page).to have_css('dl', text: proposal.status)

    expect(page).to have_css('h1', text: 'Suas propostas:')
    expect(page).to have_css('dl', text: other_proposal.requested_knowledge)
    expect(page).to have_css('dl', text: other_proposal.offered_knowledge)
    expect(page).to have_css('dl', text: 'Email')
    expect(page).to have_css('dl', text: other_proposal.day_period)
    expect(page).to have_css('dl', text: other_proposal.meeting_type)
    expect(page).to have_css('dl', text: other_proposal.status)
    #expectativa
  end
end
