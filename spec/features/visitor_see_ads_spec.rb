require 'rails_helper'

feature 'Visitor See Ads' do
  scenario 'successfully' do
    #dados
    ad = create(:ad)

    #navegaçao
    visit root_path

    #expectativa
    expect(page).to have_css('h3', 'Quero aprender Ruby on Rails!')
  end
end
