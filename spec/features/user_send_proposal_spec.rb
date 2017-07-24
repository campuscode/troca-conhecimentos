require 'rails_helper'

feature 'user send proposal' do
    scenario 'sucessfully' do
    #criacao dos dados necessarios
    user = create(:user)
    login_as(user)
    ad = Ad.create(requested_knowledge: 'Quero aprender Ruby on Rails!', offered_knowledge: 'sei python', meeting_type: 'presencial',
                       day_period: 'noite', location: 'Sao paulo', avaliability: 'um mes')

    #simula a acao
    visit root_path
    click_on 'Quero aprender Ruby on Rails!'

    click_on 'Enviar proposta'

    fill_in 'Minhas qualificaçoes sobre o tema', with: ad.requested_knowledge
    fill_in 'Conhecimento que desejo aprender', with: ad.offered_knowledge
    fill_in 'Email', with: 'teste@teste.com'
    fill_in 'Periodo do dia', with: ad.day_period
    fill_in 'Formato', with: ad.meeting_type

    click_on 'Enviar'

    #expectativa do usuario apos a acao
    expect(page).to have_css('h1', text: 'sua proposta foi enviada com sucesso!')
    expect(page).to have_css('li', text: ad.requested_knowledge)
    expect(page).to have_css('li', text: ad.offered_knowledge)
    expect(page).to have_css('li', text: 'Email')
    expect(page).to have_css('li', text: ad.day_period)
    expect(page).to have_css('li', text: ad.meeting_type)

    end

    scenario 'and must fill all informations' do
    #cria os dados necessarios
    user = create(:user)
    login_as(user)
    #ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')
    anuncio = Ad.create(requested_knowledge: 'Quero aprender Ruby on Rails!', offered_knowledge: 'sei python', meeting_type: 'presencial',
                        day_period: 'noite', location: 'Sao paulo', avaliability: 'um mes')

    #simula a acao
    visit root_path

    click_on 'Quero aprender Ruby on Rails!'
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
