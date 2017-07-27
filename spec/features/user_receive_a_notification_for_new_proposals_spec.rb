require 'rails_helper'

feature 'User receives a notification for new proposals' do
  scenario 'successfully' do


    ad_owner = create(:user, email: 'owner@mail.com')
    create(:profile, user: ad_owner)
    user = create(:user, email: 'user@mail.com')
    create(:profile, user: user)
    ad = create(:ad, user: ad_owner, requested_knowledge: 'Aprender a assobiar')

    login_as(user)
    visit root_path
    click_on 'Aprender a assobiar'
    click_on 'Enviar proposta'
    fill_in 'Minhas qualificaçoes sobre o tema', with: 'Eu seu assobiar'
    fill_in 'Conhecimento que desejo aprender', with: 'Aprender a programar'
    fill_in 'Email', with: 'user@mail.com'
    fill_in 'Periodo do dia', with: 'Diurno'
    fill_in 'Formato', with: 'Presencial lá em casa'

    expect(ProposalMailer).to receive(:notify_new_proposal).with(ad)
                                                           .and_call_original

    click_on 'Enviar'
  end
end
