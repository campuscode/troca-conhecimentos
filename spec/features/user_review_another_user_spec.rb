require 'rails_helper'

feature 'User review another user' do
  scenario 'successfully' do
    #dados
    user = create(:user)
    create(:profile, user: user)
    ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!', user: user)

    another_user = create(:user, email: 'another_user@anotheruser.com')
    create(:profile, user: another_user)
    proposal = create(:proposal, user: another_user, ad: ad, description: 'Sei tocar violao e conheço bastante de Ruby on Rails',
                      requested_knowledge: 'Quero aprender a cozinhar', email: 'eliza@teste.com',
                      day_period: 'Manha', meeting_type: 'Online', status: :approved)

    login_as(another_user)

    #acao do usuario
    visit root_path

    click_on 'Minhas propostas'
    click_on 'Avaliar troca de conhecimento'

    select '4', from: 'Nota'
    fill_in 'Comentário', with: 'O usuário é muito atencioso e sabe ensinar bem.'

    click_on 'Enviar'

    #expectativa
    expect(page).to have_css('h3', text: user.profile.name)
    expect(page).to have_css('dd', text: '4')
    expect(page).to have_css('p', text: 'O usuário é muito atencioso e sabe ensinar bem.')
  end

  scenario 'and proposal not approved' do
    #dados
    user = create(:user)
    create(:profile, user: user)
    ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!', user: user)

    another_user = create(:user, email: 'another_user@anotheruser.com')
    create(:profile, user: another_user)
    proposal = create(:proposal, user: another_user, ad: ad, description: 'Sei tocar violao e conheço bastante de Ruby on Rails',
                      requested_knowledge: 'Quero aprender a cozinhar', email: 'eliza@teste.com',
                      day_period: 'Manha', meeting_type: 'Online')

    login_as(another_user)

    #acao do usuario
    visit root_path

    click_on 'Minhas propostas'

    #expectativa
    expect(page).not_to have_link('Avaliar troca de conhecimento')
  end

  scenario 'and profile was already reviewed' do
    #dados
    #dados
    user = create(:user)
    profile = create(:profile, user: user)
    ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!', user: user)

    another_user = create(:user, email: 'another_user@anotheruser.com')
    create(:profile, user: another_user)
    proposal = create(:proposal, user: another_user, ad: ad, description: 'Sei tocar violao e conheço bastante de Ruby on Rails',
                      requested_knowledge: 'Quero aprender a cozinhar', email: 'eliza@teste.com',
                      day_period: 'Manha', meeting_type: 'Online', status: :approved)

    review = create(:profile_review, user: another_user, profile: profile)

    #acao do usuario
    login_as(another_user)
    visit root_path

    click_on 'Minhas propostas'

    #expectativa
    expect(page).not_to have_link('Avaliar troca de conhecimento')
    expect(page).to have_css('p', text: 'Profile já avaliado')
  end
end
