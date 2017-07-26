require 'rails_helper'
feature 'user list his proposals' do
  scenario 'successfully' do
    user = create(:user)
    create(:profile, user: user)
    login_as(user)
    ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')
    proposal = create(:proposal, user: user, ad: ad, meeting_type: 'Online',
                                 description: 'Sei tocar violao',
                                 requested_knowledge: 'Aprender a cozinhar',
                                 day_period: 'Manha', status: :approved)

    create(:ad, requested_knowledge: 'Quero aprender Java')
    other_proposal = create(:proposal, user: user, meeting_type: 'Online',
                                       ad: ad, description: 'Sei tocar violao',
                                       requested_knowledge: 'Cozinhar',
                                       day_period: 'Manha', status: :pending)

    visit root_path

    click_on 'Minhas propostas'

    expect(page).to have_css('h1', text: 'Suas propostas:')
    expect(page).to have_css('dl', text: proposal.requested_knowledge)
    expect(page).to have_css('dl', text: 'Email')
    expect(page).to have_css('dl', text: proposal.day_period)
    expect(page).to have_css('dl', text: proposal.meeting_type)
    expect(page).to have_css('dl', text: proposal.status)

    expect(page).to have_css('h1', text: 'Suas propostas:')
    expect(page).to have_css('dl', text: other_proposal.requested_knowledge)
    expect(page).to have_css('dl', text: 'Email')
    expect(page).to have_css('dl', text: other_proposal.day_period)
    expect(page).to have_css('dl', text: other_proposal.meeting_type)
    expect(page).to have_css('dl', text: other_proposal.status)
  end

  scenario 'user has no proposals' do
    user = create(:user)
    create(:profile, user: user)
    login_as(user)

    visit root_path

    click_on 'Minhas propostas'

    expect(page).to have_css('h1', text: 'Voce nao tem propostas cadastradas')
  end

  scenario 'user oly see your proposals' do
    user = create(:user)
    create(:profile, user: user)
    ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')
    proposal = create(:proposal, user: user, ad: ad, meeting_type: 'Online',
                                 description: 'Sei tocar violao',
                                 requested_knowledge: 'Aprender a cozinhar',
                                 day_period: 'Manha', status: :approved)

    another_user = create(:user)
    create(:profile, user: another_user)
    another_ad = create(:ad, requested_knowledge: 'Quero aprender java!')
    another_proposal = create(:proposal, user: another_user, status: :pending,
                                         day_period: 'Tarde', ad: another_ad,
                                         description: 'Sei Jogar Bola',
                                         requested_knowledge: 'Aprender violao',
                                         meeting_type: 'presencial')

    login_as(user)

    visit root_path

    click_on 'Minhas propostas'

    expect(page).to have_css('dl', text: proposal.requested_knowledge)
    expect(page).to have_css('dl', text: proposal.email)
    expect(page).to have_css('dl', text: proposal.day_period)
    expect(page).to have_css('dl', text: proposal.meeting_type)
    expect(page).to have_css('dl', text: proposal.status)

    expect(page).not_to have_css('dl',
                                 text: another_proposal.requested_knowledge)
    expect(page).not_to have_css('dl', text: another_proposal.email)
    expect(page).not_to have_css('dl', text: another_proposal.day_period)
    expect(page).not_to have_css('dl', text: another_proposal.meeting_type)
    expect(page).not_to have_css('dl', text: another_proposal.status)
  end
end
