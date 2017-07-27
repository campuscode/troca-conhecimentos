require 'rails_helper'

feature 'User accept proposal' do

  scenario 'sucessfully' do
    user = create(:user)
    profile = create(:profile, name: 'Joao', user: user)
    ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!', active: true, user: user)
    proposal = create(:proposal, requested_knowledge: 'Quero aprender Ruby on Rails!', ad: ad, status: :pending, user: user)
    login_as(user)
    visit root_path

    click_on 'Propostas recebidas'
    click_on 'Aceitar'

    expect(page).to have_content('Proposta aceita com sucesso.')
    expect(page).not_to have_content('Quero aprender Ruby on Rails!')
  end


  scenario 'and there are another proposals' do
    user = create(:user)
    profile = create(:profile, name: 'Joao', user: user)
    login_as(user)

    ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!', active: true, user: user)
    proposal = create(:proposal, requested_knowledge: 'Quero aprender Ruby on Rails!', ad: ad, status: :pending)

    ad2 = create(:ad, requested_knowledge: 'Quero aprender Piano!', active: true, user: user)
    proposal2 = create(:proposal, requested_knowledge: 'Quero aprender Piano!', ad: ad2, status: :pending, user: user)

    visit root_path
    click_on 'Propostas recebidas'
    within("div\#proposal-#{proposal2.id}") do
      click_on 'Aceitar'
    end


    expect(page).to have_content('Proposta aceita com sucesso.')
    expect(page).not_to have_content('Quero aprender Piano!')

  end

end
