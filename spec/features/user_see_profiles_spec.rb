require 'rails_helper'
feature 'User sees profiles from ad owner' do
  scenario 'successfully' do
    user = create(:user)
    owner = create(:user, email: 'owner@teste.com')
    profile = create(:profile, name: 'Joao', user: owner)
    ad = create(:ad, title: 'Urgente, aprender alemão!', user: owner)

    login_as(user)
    visit root_path
    click_on 'Criado por Joao'

    expect(page).to have_css('h3', text: profile.name)
    expect(page).to have_css('dt', text: 'Data de Nascimento')
    expect(page).to have_css('dd', text: '14/04/1992')
    expect(page).to have_css('dt', text: 'Cidade')
    expect(page).to have_css('dd', text: profile.city)
    expect(page).to have_css('dt', text: 'Estado')
    expect(page).to have_css('dd', text: profile.state)
    expect(page).to have_css('label', text: 'Conhecimentos:')
    expect(page).to have_css('p', text: profile.skills)
  end
end
