require 'rails_helper'

feature 'User create Ad' do

  scenario 'successfully' do
    ad = build(:ad)

    visit root_path
    click_on 'Criar Anuncio'

    fill_in 'A oferecer', with: ad.requested_knowledge
    fill_in 'A Aprender', with: ad.offered_knowledge
    fill_in 'Meeting', with: ad.meeting_type
    fill_in 'Periodo', with: ad.day_period
    fill_in 'Localizacao', with: ad.location
    fill_in 'Quando', with: ad.availability

    click_on 'Enviar'

    #expect strang things
    expect(page).to have_content('Bem-vindo')
  end

end
