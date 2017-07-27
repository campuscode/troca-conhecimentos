require 'rails_helper'

feature 'user rejects proposal' do
  scenario 'sucessfully' do
    user = create(:user)
    login_as(user)
    ad = create(:ad, requested_knowledge: 'aprender ruby',
                     status: :active, user: user)
    create(:proposal, requested_knowledge: 'aprender ruby',
                      ad: ad, status: :pending)

    visit root_path
    click_on 'Propostas recebidas'
    click_on 'Recusar'

    expect(page).to have_content('Proposta recusada com sucesso.')

    within("div\#proposal-rejected") do
      expect(page).to have_content('aprender ruby')
    end
  end

  scenario 'and there are another proposals' do
    user = create(:user)

    login_as(user)

    ad = create(:ad, requested_knowledge: 'aprender ruby',
                     status: :active, user: user)
    create(:proposal, requested_knowledge: 'aprender ruby',
                      ad: ad, status: :pending)

    ad2 = create(:ad, requested_knowledge: 'Piano', status: :active, user: user)
    proposal2 = create(:proposal, requested_knowledge: 'Piano',
                      ad: ad2, status: :pending)

    visit root_path
    click_on 'Propostas recebidas'
    within("div\#proposal-#{proposal2.id}") do
      click_on 'Recusar'
    end

    expect(page).to have_content('Proposta recusada com sucesso.')

    within("div\#proposal-rejected") do
      expect(page).to have_content('Piano')
    end
  end
end
