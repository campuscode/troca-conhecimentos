require 'rails_helper'

feature 'User accept proposal' do

  scenario 'sucessfully' do
    user = create(:user)
    login_as(user)
    ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!', user: user)
    proposal = create(:proposal, requested_knowledge: 'Quero aprender Ruby on Rails!', ad: ad, status: :pending)

    visit root_path
    click_on 'Propostas recebidas'
    click_on 'Aceitar'

    expect(page).to have_content('Proposta aceita com sucesso.')
    expect(page).not_to have_content('Quero aprender Ruby on Rails!')
  end


  scenario 'and there are another proposals' do
    user = create(:user)

    login_as(user)

    ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!', user: user)
    proposal = create(:proposal, requested_knowledge: 'Quero aprender Ruby on Rails!', ad: ad, status: :pending)

    ad2 = create(:ad, requested_knowledge: 'Quero aprender Piano!', user: user)
    proposal2 = create(:proposal, requested_knowledge: 'Quero aprender Piano!', ad: ad2, status: :pending)

    visit root_path
    click_on 'Propostas recebidas'
    within("div\#proposal-#{proposal2.id}") do
      click_on 'Aceitar'
    end


    expect(page).to have_content('Proposta aceita com sucesso.')
    expect(page).not_to have_content('Quero aprender Piano!')

  end

end
