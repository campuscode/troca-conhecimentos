require 'rails_helper'

feature 'User upload photo in profile' do
  scenario 'sucessfully' do
    user = create(:user, password: '123456')
    profile = create(:profile, name: 'Joao Henrique', user: user)
    login_as(user, scope: :user)

    visit root_path
    click_on 'Joao Henrique'
    click_on 'Editar meu perfil'

    attach_file('Minha Foto', "#{Rails.root}/spec/support/photos/my_photo.jpg")
    click_on 'Enviar'

     expect(page).to have_xpath("//img[contains(@src,'my_photo.jpg')]")
  end
end
