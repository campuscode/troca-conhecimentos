require 'rails_helper'
feature 'Visitor create account' do
  scenario 'successfully' do

    visit root_path
    click_on 'Cadastrar'

    fill_in 'Email', with: 'teste@teste.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme a senha', with: '123456'
    click_on 'Cadastrar'

    expect(current_path).to eq root_path
    expect(page).to have_css('h2', text: 'Você ainda nao completou o seu perfil, Clique aqui para continuar')
    expect(page).to have_link('Clique aqui')

  end
end
