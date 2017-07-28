require 'rails_helper'

feature 'user can see all proposals' do
  scenario 'sucessfully' do
    user = create(:user)
    create(:profile, user: user)
    login_as(user)

    ad = create(:ad, requested_knowledge: 'aprender Ruby on Rails!',
                     status: :active, user: user)
    create(:proposal, ad: ad, status: :approved,
                      requested_knowledge: 'aprender Ruby on Rails!')

    ad2 = create(:ad, requested_knowledge: 'Quero aprender Piano!',
                      status: :active, user: user)
    create(:proposal, ad: ad2, status: :pending,
                      requested_knowledge: 'Quero aprender Piano!')

    ad3 = create(:ad, requested_knowledge: 'aprender guitarra!',
                      status: :active, user: user)
    create(:proposal, ad: ad3, status: :rejected,
                      requested_knowledge: 'aprender guitarra!')

    visit root_path
    click_on 'Propostas recebidas'

    expect(page).to have_css('h2', text: 'Minhas propostas')

    within("div\#proposal-approved") do
      expect(page).to have_content('aprender Ruby on Rails!')
      expect(page).not_to have_content('Quero aprender Piano!')
      expect(page).not_to have_content('aprender guitarra!')
      expect(page).to have_css('h3', text: 'Aprovadas')
    end

    within("div\#proposal-pending") do
      expect(page).to have_content('Quero aprender Piano!')
      expect(page).not_to have_content('aprender Ruby on Rails!')
      expect(page).not_to have_content('aprender guitarra!')
      expect(page).to have_css('h3', text: 'Pendentes')
    end

    within("div\#proposal-rejected") do
      expect(page).to have_content('aprender guitarra!')
      expect(page).not_to have_content('Quero aprender Piano!')
      expect(page).not_to have_content('aprender Ruby on Rails!')
      expect(page).to have_css('h3', text: 'Rejeitadas')
    end
  end
end
