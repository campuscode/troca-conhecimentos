require 'rails_helper'

feature 'user send proposal' do
    scenario 'sucessfully' do
      #criacao dos dados necessarios
      user = create(:user)
      login_as(user)
      ad = FactoryGirl.create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')

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
      expect(page).to have_css('dl', text: ad.requested_knowledge)
      expect(page).to have_css('dl', text: ad.offered_knowledge)
      expect(page).to have_css('dl', text: 'Email')
      expect(page).to have_css('dl', text: ad.day_period)
      expect(page).to have_css('dl', text: ad.meeting_type)

    end

    scenario 'and must fill all informations' do
      #cria os dados necessarios
      user = create(:user)
      login_as(user)
      #ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')
      FactoryGirl.create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')

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

    scenario 'and proposal cannot be the same' do
      #cria os dados necessarios
      user = create(:user)
      login_as(user)
      #ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')
      ad = FactoryGirl.create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')
      proposal = FactoryGirl.create(:proposal, user: user, ad: ad, requested_knowledge:'Quero aprender Ruby on Rails!',
                                     email: 'eliza@teste.com', day_period: 'noite', meeting_type: 'presencial')

      #simula a acao
      visit root_path

      click_on 'Quero aprender Ruby on Rails!'

      #expectativa apos a acao
      expect(page).not_to have_link('Enviar proposta')

      expect(page).to have_css('h1', text: 'Dados da sua proposta:')
      expect(page).to have_css('dl', text: proposal.requested_knowledge)
      expect(page).to have_css('dl', text: proposal.email)
      expect(page).to have_css('dl', text: proposal.day_period)
      expect(page).to have_css('dl', text: proposal.meeting_type)
    end
end
