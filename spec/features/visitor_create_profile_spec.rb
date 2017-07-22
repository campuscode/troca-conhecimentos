require 'rails_helper'
feature 'Visitor create account' do
  scenario 'successfully' do

    visit root_path
    click_on 'Cadastrar'

    within('form') do
      fill_in 'Email', with: 'teste@teste.com'
      fill_in 'Senha', with: '123456'
      fill_in 'Confirme sua senha', with: '123456'
      click_on 'Cadastrar'
    end

    expect(current_path).to eq root_path
    expect(page).to have_css('h2', text: 'Você ainda nao completou o seu perfil, Clique aqui para continuar')
    expect(page).to have_link('Clique aqui')
  end
  scenario 'user Log in ' do
    user = create(:user, password: '123456')

    visit root_path
    click_on 'Log in'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: '123456'
    within("div.actions")  do
      click_on 'Log in'
    end


    expect(current_path).to eq root_path
    expect(page).to have_content('Você ainda nao completou o seu perfil, Clique aqui para continuar')

  end

  scenario 'user complete' do
    user = create(:user, password: '123456')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Clique aqui'

    fill_in 'Nome', with:'Joao'
    fill_in 'Data de Nascimento', with:'14/04/1992'
    fill_in 'Cidade', with:'São Paulo'
    fill_in 'Estado', with:'SP'
    fill_in 'Habilidades', with: 'Sei tocar guitarra, fazer 1000 embaixadinhas!'
    fill_in 'Minha Foto', with: ''

    click_on 'Enviar'

    expect(page).to have_content('Seu perfil está concluido, aproveite.')

  end

  scenario 'user complete profile missing some attributes' do
    user = create(:user, password: '123456')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Clique aqui'

    fill_in 'Nome', with:''
    fill_in 'Data de Nascimento', with:''
    fill_in 'Cidade', with:''
    fill_in 'Estado', with:''
    fill_in 'Habilidades', with: ''
    fill_in 'Minha Foto', with: ''

    click_on 'Enviar'

    expect(page).to have_content('É necessario preencher todos os campos.')
  end



end
