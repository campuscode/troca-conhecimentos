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

  scenario 'when there is no ad to show' do
    #dados

    #navegacao
    visit root_path

    #expectativa
    expect(page).to have_css('h3', text: 'Não temos anúncios por agora em breve novos anúncios para você. Volte logo!')
  end
end
