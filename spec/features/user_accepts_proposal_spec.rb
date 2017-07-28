require 'rails_helper'

feature 'User accept proposal' do
  scenario 'sucessfully' do
    user = create(:user)
    login_as(user)
    profile = create(:profile, name: 'Joao', user: user)
    ad = create(:ad, status: :active, user: user,
                     requested_knowledge: 'Quero aprender Ruby on Rails!')
    create(:proposal, ad: ad, status: :pending,
                      requested_knowledge: 'Quero aprender Ruby on Rails!',
                      user: user)

    visit root_path

    click_on 'Propostas recebidas'
    click_on 'Aceitar'

    expect(page).to have_content('Proposta aceita com sucesso.')
    within("div\#proposal-approved") do
      expect(page).to have_content('Quero aprender Ruby on Rails!')
    end
  end

  scenario 'and there are another proposals' do
    user = create(:user)
    profile = create(:profile, name: 'Joao', user: user)
    ad = create(:ad, status: :active, user: user,
                     requested_knowledge: 'Quero aprender Ruby on Rails!')
    create(:proposal, ad: ad, status: :pending,
                      requested_knowledge: 'Quero aprender Ruby on Rails!')

    ad2 = create(:ad, status: :active, user: user,
                      requested_knowledge: 'Quero aprender Piano!')
    proposal2 = create(:proposal, ad: ad2, status: :pending,
                      requested_knowledge: 'Quero aprender Piano!',
                      user: user)

    login_as(user)
    visit root_path
    click_on 'Propostas recebidas'
    within("div\#proposal-#{proposal2.id}") do
      click_on 'Aceitar'
    end

    expect(page).to have_content('Proposta aceita com sucesso.')
    within("div\#proposal-approved") do
      expect(page).to have_content('Quero aprender Piano!')
    end
  end
end
