require 'rails_helper'

feature 'User accept proposal' do

  scenario 'sucessfully' do
    user = create(:user)
    login_as(user)
    ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!', active: true, user: user)
    proposal = create(:proposal, requested_knowledge: 'Quero aprender Ruby on Rails!', ad: ad)

    visit root_path
    click_on 'Propostas recebidas'
    click_on 'Aceitar'

    expect(page).to have_content('Proposta aceita com sucesso.')
    expect(page).not_to have_css('h1', text: proposal.offered_knowledge)
  end

end
