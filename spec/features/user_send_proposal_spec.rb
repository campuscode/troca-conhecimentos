require 'rails_helper'

feature 'user send proposal' do
    scenario 'sucessfully' do
    #criacao dos dados necessarios
    user = create(:user)
    login_as(user)     
    
    #simula a acao
    visit root_path

    click_on 'Enviar proposta'

    fill_in 'Minhas qualificaçoes sobre o tema', with: 'sei python'
    fill_in 'Conhecimento que desejo aprender', with: 'quero aprender ruby'
    fill_in 'Email', with: 'teste@teste.com'
    fill_in 'Periodo do dia', with: 'noite'
    fill_in 'Formato', with: 'presencial'
    
    click_on 'Enviar'
    
    #expectativa do usuario apos a acao
    expect(page).to have_css('h1', text: 'sua proposta foi enviada com sucesso')
    
    end     

    scenario 'and must fill all informations' do
    #cria os dados necessarios
    user = create(:user)
    login_as(user)
    
    #simula a acao
    visit root_path

    click_on 'Enviar proposta'

    fill_in 'Minhas qualificaçoes sobre o tema', with: ''
    fill_in 'Conhecimento que desejo aprender', with: ''
    fill_in 'Email', with: ''
    fill_in 'Periodo do dia', with: ''
    fill_in 'Formato', with: ''
    
    click_on 'Enviar'
    
    #expectativa apos a acao
    expect(page).to have_css('label', text: 'Houve um erro ao tentar enviar a proposta')     

    end 
end    