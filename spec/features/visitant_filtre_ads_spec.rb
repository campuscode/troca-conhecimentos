require 'rails_helper'

feature 'visitant filter ads' do
  scenario 'sucessfully' do
    #dados
    user = create(:user)
    another_user = create(:user)
    create(:profile, name: 'Joao', user: user)
    create(:profile, name: 'Joao', user: another_user)
    ad = create(:ad, user: another_user, requested_knowledge: 'Quero aprender Culinária!')
    another_ad1 = create(:ad, user: another_user, requested_knowledge: 'Aprender violão',
                              offered_knowledge: 'Ensinar Culinária')
    another_ad2 = create(:ad, user: another_user,
                              requested_knowledge: 'Quero aprender Ruby on Rails!')
    #navegaçao
    visit root_path

    fill_in 'Busca', with: 'Culinária'
    click_on 'Buscar'

    #expectations
    expect(page).not_to have_content('Quero aprender Ruby on Rails!')
    expect(page).to have_content('Quero aprender Culinária!')
    expect(page).to have_content('Aprender violão')
    expect(page).to have_content('Resultado da busca: "Culinária"')
  end

  scenario 'search results not found' do
    #dados
    user = create(:user)
    another_user = create(:user)
    create(:profile, name: 'Joao', user: user)
    create(:profile, name: 'Joao', user: another_user)
    ad = create(:ad, user: another_user, requested_knowledge: 'Quero aprender Ruby on Rails!')

    #navegaçao
    visit root_path

    fill_in 'Busca', with: 'Culinária'
    click_on 'Buscar'

    #expectations
    expect(page).not_to have_content('Quero aprender Culinária!')
    expect(page).to have_content('Resultado da busca: "Culinária"')
    expect(page).to have_content('Não encontramos resultados para a busca!')
  end
end
