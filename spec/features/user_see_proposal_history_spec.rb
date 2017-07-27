require 'rails_helper'

feature 'user can see all proposals' do
  scenario 'sucessfully' do
    user = create(:user)

    login_as(user)

    ad = create(:ad, requested_knowledge: 'aprender Ruby on Rails!',
                     active: true, user: user)
    create(:proposal, ad: ad, status: :approved,
                      requested_knowledge: 'aprender Ruby on Rails!')

    ad2 = create(:ad, requested_knowledge: 'Quero aprender Piano!',
                      active: true, user: user)
    create(:proposal, ad: ad2, status: :pending,
                      requested_knowledge: 'Quero aprender Piano!')

    ad3 = create(:ad, requested_knowledge: 'aprender guitarra!',
                      active: true, user: user)
    create(:proposal, ad: ad3, status: :rejected,
                      requested_knowledge: 'aprender guitarra!')

    visit root_path
    click_on 'Propostas recebidas'

    expect(page).to have_css('h1', text: 'Minhas propostas recebidas')

    within("div\#proposal-approved") do
      expect(page).to have_content('aprender Ruby on Rails!')
      expect(page).not_to have_content('Quero aprender Piano!')
      expect(page).not_to have_content('aprender guitarra!')
    end

    within("div\#proposal-pending") do
      expect(page).to have_content('Quero aprender Piano!')
      expect(page).not_to have_content('aprender Ruby on Rails!')
      expect(page).not_to have_content('aprender guitarra!')
    end

    within("div\#proposal-rejected") do
      expect(page).to have_content('aprender guitarra!')
      expect(page).not_to have_content('Quero aprender Piano!')
      expect(page).not_to have_content('aprender Ruby on Rails!')
    end
  end
end
