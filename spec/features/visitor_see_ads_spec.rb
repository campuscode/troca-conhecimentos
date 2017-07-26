require 'rails_helper'

feature 'Visitor See Ads' do
  scenario 'successfully' do
    # dados
    create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')

    # navegacao
    visit root_path

    # expectativa
    expect(page).to have_css('h3', text: 'Quero aprender Ruby on Rails!')
  end

  scenario 'and there is no ad to show' do
    # dados

    # navegacao
    visit root_path
    message = "Não temos anúncios por agora em \
breve novos anúncios para você. Volte logo!"
    # expectativa
    expect(page).to have_css('h3', text: message)
  end

  scenario 'and see more then one ad' do
    # dados
    another_user = create(:user, email: 'novo@usuario.com')
    user = create(:user, email: 'aham@usuario.com')
    create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')
    create(:ad, requested_knowledge: 'Gostaria de aprender Java for Web',
                user: another_user)
    message = 'Gostaria de aprender a fazer móveis bacanas!'
    create(:ad, requested_knowledge: message,
                user: user)

    # navegacao
    visit root_path

    # expectativa
    expect(page).to have_css('h3', text: 'Quero aprender Ruby on Rails!')
    expect(page).to have_css('h3', text: 'Gostaria de aprender Java for Web')
    message = 'Gostaria de aprender a fazer móveis bacanas!'
    expect(page).to have_css('h3', text: message)
  end
end
