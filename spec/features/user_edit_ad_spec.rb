require 'rails_helper'
feature 'user edit ad' do
  scenario 'successfully' do
    user = create(:user)
    login_as(user)
    profile = create(:profile, name: 'Joao', user: user)
    ad = create(:ad, status: :active, user: user,
                     requested_knowledge: 'Quero aprender Ruby on Rails!')
    visit root_path

    click_on profile.name
    click_on 'Ver Anúncios'
    click_on ad.title
    click_on 'Editar anúncio'

    fill_in 'Titulo', with: 'Aprender ROR'
    fill_in 'Conhecimento a adquirir', with: ad.requested_knowledge
    fill_in 'Conhecimento a oferecer', with: ad.offered_knowledge
    fill_in 'Tipo de encontro', with: ad.meeting_type
    fill_in 'Período do dia', with: ad.day_period
    fill_in 'Local do encontro', with: ad.location
    fill_in 'Quando estou disponível', with: ad.avaliability

    click_on 'Enviar'

    #expect strang things
    expect(page).to have_css('h1', text: 'Aprender ROR')
    expect(page).to have_css('dd', text: ad.requested_knowledge)
    expect(page).to have_css('dd', text: ad.offered_knowledge)
    expect(page).to have_css('dd', text: ad.meeting_type)
    expect(page).to have_css('dd', text: ad.day_period)
    expect(page).to have_css('dd', text: ad.location)
    expect(page).to have_css('dd', text: ad.avaliability)

  end
end
