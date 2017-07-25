require 'rails_helper'

feature 'User accept proposal' do

  scenario 'sucessfully' do
    user = create(:user)
    login_as(user)
    ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')
    proposal = create(:proposal)

    visit root_path
    click_on 'Propostas recebidas'
    click_on proposal.offered_knowledge
    click_on 'Aceitar'

    expect(page).to have_content('Proposta aceita com sucesso.')
    expect(page).not_to have_css('h1', text: proposal.offered_knowledge)
  end

end
