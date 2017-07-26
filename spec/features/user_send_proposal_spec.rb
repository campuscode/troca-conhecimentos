require 'rails_helper'

feature 'user send proposal' do
  scenario 'sucessfully' do
    # criacao dos dados necessarios
    user = create(:user)
    login_as(user)
    message = 'Quero aprender Ruby on Rails!'
    ad = create(:ad, requested_knowledge: message)
    proposal = build(:proposal)

    # simula a acao
    visit root_path
    click_on 'Quero aprender Ruby on Rails!'

    click_on 'Enviar proposta'

    fill_in 'Minhas qualificaçoes sobre o tema', with: proposal.description
    fill_in 'Conhecimento que desejo aprender', with: proposal.requested_knowledge
    fill_in 'Email', with: proposal.email
    fill_in 'Periodo do dia', with: proposal.day_period
    fill_in 'Formato', with: proposal.meeting_type

    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Dados da sua proposta')
    expect(page).to have_css('dd', text: proposal.description)
    expect(page).to have_css('dd', text: proposal.requested_knowledge)
    expect(page).to have_css('dd', text: proposal.email)
    expect(page).to have_css('dd', text: proposal.day_period)
    expect(page).to have_css('dd', text: proposal.meeting_type)
  end

  scenario 'and must fill all informations' do
    # cria os dados necessarios
    user = create(:user)
    login_as(user)
    # ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')
    msg = 'Quero aprender Ruby on Rails!'
    FactoryGirl.create(:ad, requested_knowledge: msg)

    # simula a acao
    visit root_path

    click_on 'Quero aprender Ruby on Rails!'
    click_on 'Enviar proposta'

    fill_in 'Minhas qualificaçoes sobre o tema', with: ''
    fill_in 'Conhecimento que desejo aprender', with: ''
    fill_in 'Email', with: ''
    fill_in 'Periodo do dia', with: ''
    fill_in 'Formato', with: ''

    click_on 'Enviar'

    # expectativa apos a acao
    msg = 'Houve um erro ao tentar enviar a proposta'
    expect(page).to have_css('label', text: msg)
  end

  scenario 'and proposal cannot be the same' do
    # cria os dados necessarios
    user = create(:user)
    login_as(user)
    # ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')
    msg = 'Quero aprender Ruby on Rails!'
    ad = FactoryGirl.create(:ad, requested_knowledge: msg)

    msg = 'Quero aprender Ruby on Rails!',
    proposal = FactoryGirl.create(:proposal, user: user, ad: ad,
                                             requested_knowledge: msg,
                                             email: 'eliza@teste.com',
                                             day_period: 'noite',
                                             meeting_type: 'presencial')

    # simula a acao
    visit root_path

    click_on 'Quero aprender Ruby on Rails!'

    # expectativa apos a acao
    expect(page).not_to have_link('Enviar proposta')

    expect(page).to have_css('h1', text: 'Dados da sua proposta:')
    expect(page).to have_css('dd', text: proposal.description)
    expect(page).to have_css('dd', text: proposal.requested_knowledge)
    expect(page).to have_css('dd', text: proposal.email)
    expect(page).to have_css('dd', text: proposal.day_period)
    expect(page).to have_css('dd', text: proposal.meeting_type)
    end
end
