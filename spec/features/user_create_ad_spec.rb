require 'rails_helper'

feature 'User create Ad' do

  scenario 'successfully' do
    user = create(:user)
    login_as(user, scope: :user)

    ad = build(:ad)

    visit root_path
    click_on 'Criar Anuncio'

    fill_in 'A oferecer', with: ad.requested_knowledge
    fill_in 'A Aprender', with: ad.offered_knowledge
    fill_in 'Meeting', with: ad.meeting_type
    fill_in 'Periodo', with: ad.day_period
    fill_in 'Localizacao', with: ad.location
    fill_in 'Quando', with: ad.avaliability

    click_on 'Enviar'

    #expect strang things
    expect(page).to have_css('h1', text: ad.requested_knowledge)
    expect(page).to have_css('li', text: ad.offered_knowledge)
    expect(page).to have_css('li', text: ad.meeting_type)
    expect(page).to have_css('li', text: ad.day_period)
    expect(page).to have_css('li', text: ad.location)
    expect(page).to have_css('li', text: ad.avaliability)
  end

end
