require 'rails_helper'

feature 'visitant filter ads' do
  scenario 'sucessfully' do
    #dados
    ad = create(:ad, requested_knowledge: 'Quero aprender Culinária!')
    another_ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')

    #navegaçao
    visit root_path

    fill_in 'Busca', with: 'Culinária'
    click_on 'Buscar'

    #expectations
    expect(page).not_to have_content('Quero aprender Ruby on Rails!')
    expect(page).to have_content('Quero aprender Culinária!')
    expect(page).to have_content('Resultado da busca: "Culinária"')
  end

  scenario 'search results not found' do
    #dados
    ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')

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
