require 'rails_helper'

feature 'User finish ad' do

  scenario 'successfully' do
    user = create(:user)
    profile = create(:profile, name: 'Joao Henrique', user: user)
    login_as(user, scope: :user)

    ad = create(:ad, user: user, requested_knowledge: 'Quero aprender Rails!' )

    visit root_path
    click_on 'Joao Henrique'
    click_on 'Ver Anúncios'
    click_on ad.requested_knowledge
    click_on 'Encerrar anúncio'

    expect(page).to have_content('Quero aprender Rails! (Anúncio encerrado)')
    expect(page).not_to have_link('Encerrar anúncio')
  end

  scenario 'and ad is not mine' do
    user = create(:user)
    create(:profile, name: 'Joao Henrique', user: user)
    ad = create(:ad, user: user, requested_knowledge: 'Quero aprender Rails!')

    another_user = create(:user, email: 'anotheruser@gmail.com')
    create(:profile, name: 'Pedro Alvares', user: another_user)
    another_ad = create(:ad, user: another_user, requested_knowledge: 'Quero aprender Java!')

    login_as(another_user, scope: :user)

    visit root_path
    click_on ad.requested_knowledge

    expect(page).not_to have_link('Encerrar anúncio')
  end

  scenario 'and ad has finish' do
    user = create(:user)
    create(:profile, name: 'Joao Henrique', user: user)
    ad = create(:ad, user: user, requested_knowledge: 'Quero aprender Rails!', status: :finish)

    login_as(user, scope: :user)

    visit root_path
    click_on 'Joao Henrique'
    click_on 'Ver Anúncios'
    click_on ad.requested_knowledge

    expect(page).not_to have_link('Encerrar anúncio')
    expect(page).to have_content('Quero aprender Rails! (Anúncio encerrado)')
  end

end
