require 'rails_helper'

feature 'User cancel ad' do
  scenario 'Sucessfully' do
    user = create(:user)
    login_as(user)
    ad = create(:ad, status: :active, user: user,
                     requested_knowledge: 'Quero aprender Ruby on Rails!')
    visit root_path
    click_on 'Meus Anuncios'
    click_on 'Cancelar'

    expect(page).to have_content('Anuncio cancelado com sucesso.')
    expect(page).to have_content('Você nao possuie nenhum anuncio ativo')
  end
end
