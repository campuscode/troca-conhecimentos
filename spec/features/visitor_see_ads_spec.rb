require 'rails_helper'

feature 'Visitor See Ads' do
  scenario 'successfully' do
    #dados
    ad = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')

    #navegaçao
    visit root_path

    #expectativa
    expect(page).to have_css('h3', text: 'Quero aprender Ruby on Rails!')
  end

  scenario 'and there is no ad to show' do
    #dados

    #navegacao
    visit root_path

    #expectativa
    expect(page).to have_css('h3', text: 'Não temos anúncios por agora em breve novos anúncios para você. Volte logo!')
  end

  scenario 'and see more then one ad' do
    #dados
    another_user = create(:user, email: 'novo@usuario.com')
    user = create(:user, email: 'aham@usuario.com')
    ad_ruby = create(:ad, requested_knowledge: 'Quero aprender Ruby on Rails!')
    ad_java = create(:ad, requested_knowledge: 'Gostaria de aprender Java for Web', user: another_user)
    ad_marcenaria = create(:ad, requested_knowledge: 'Gostaria de aprender a fazer móveis bacanas!', user: user)

    #navegaçao
    visit root_path

    #expectativa
    expect(page).to have_css('h3', text: 'Quero aprender Ruby on Rails!')
    expect(page).to have_css('h3', text: 'Gostaria de aprender Java for Web')
    expect(page).to have_css('h3', text: 'Gostaria de aprender a fazer móveis bacanas!')
  end
end
