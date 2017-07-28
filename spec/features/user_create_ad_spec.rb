require 'rails_helper'

feature 'User create Ad' do
  scenario 'successfully' do
    user = create(:user)
    login_as(user, scope: :user)

    ad = build(:ad, user: user, requested_knowledge: 'Quero aprender Rails!')

    visit root_path
    click_on 'Criar Anuncio'
    fill_in 'Titulo', with: ad.title
    fill_in 'A oferecer', with: ad.requested_knowledge
    fill_in 'A Aprender', with: ad.offered_knowledge
    fill_in 'Meeting', with: ad.meeting_type
    fill_in 'Periodo', with: ad.day_period
    fill_in 'Localizacao', with: ad.location
    fill_in 'Quando', with: ad.avaliability

    click_on 'Enviar'

    #expect strang things
    expect(page).to have_css('h1', text: ad.title)
    expect(page).to have_css('dd', text: ad.requested_knowledge)
    expect(page).to have_css('dd', text: ad.offered_knowledge)
    expect(page).to have_css('dd', text: ad.meeting_type)
    expect(page).to have_css('dd', text: ad.day_period)
    expect(page).to have_css('dd', text: ad.location)
    expect(page).to have_css('dd', text: ad.avaliability)
  end

  scenario 'and needs to be loged in' do
    build(:ad)

    visit new_ad_path
    expect(page).to have_content(I18n.t('devise.failure.unauthenticated'))
  end
  scenario 'and can only have one ad' do

    user = create(:user)
    login_as(user, scope: :user)
    create(:ad, user: user)


    visit new_ad_path
    expect(page).to have_content('Voce ja tem um anuncio ativo')
  end

  scenario 'and trie to create a second ad' do

    user = create(:user)
    login_as(user, scope: :user)
    create(:ad, user: user)

    visit root_path
    expect(page).not_to have_content('Criar Anuncio')
  end
end
