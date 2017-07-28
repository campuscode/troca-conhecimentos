require 'rails_helper'

feature 'User cancel ad' do
  scenario 'Sucessfully' do
    user = create(:user)
    login_as(user)
    profile = create(:profile, user: user)
    ad = create(:ad, status: :active, user: user,
                     requested_knowledge: 'Quero aprender Ruby on Rails!')
    visit root_path
    click_on 'Joao'
    click_on 'Ver Anúncios'
    click_on ad.title
    click_on 'Cancelar anúncio'

    expect(page).to have_content('Anuncio cancelado com sucesso.')
    expect(page).to have_content(ad.title)
    expect(page).to have_content('Cancelado')
  end
  scenario 'and the ad is not mine' do
    user = create(:user)
    create(:profile, name: 'Joao Henrique', user: user)
    ad = create(:ad, user: user, title: 'Quero aprender Rails!')

    another_user = create(:user, email: 'anotheruser@gmail.com')
    create(:profile, name: 'Pedro Alvares', user: another_user)
    another_ad = create(:ad, user: another_user, title: 'Quero aprender Java!')

    login_as(another_user, scope: :user)

    visit root_path
    click_on ad.title

    expect(page).not_to have_link('Cancelar')
  end
  scenario 'and the ad is alredy cancel' do
    user = create(:user)
    create(:profile, name: 'Joao Henrique', user: user)
    ad = create(:ad, user: user, title: 'Quero aprender Rails!', status: :cancelled)

    login_as(user)
    visit root_path
    click_on 'Joao Henrique'
    click_on 'Ver Anúncios'
    click_on ad.title

    expect(page).not_to have_link('Cancelar')
    expect(page).to have_content('Cancelado')
  end
end
