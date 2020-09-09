require 'rails_helper'

feature 'user start chatting' do
  scenario 'buyer begin' do
  
    userPedro = User.create(name: 'Pedro', email: 'pedro@email.com', 
                              password: '123456')

    userKihare = User.create(name: 'Kihare', email: 'kihare@email.com', 
                              password: '123456')

    Profile.create(name: 'Kihare', sector: 'TI', region: 'SP',
                    company: 'Box', email: 'kihare@email.com',
                    user: userKihare)          

    profilePedro = Profile.create(name: 'Pedro', sector: 'RH', region: 'SP',
                                  company: 'Box', email: 'pedro@email.com',
                                  user: userPedro)

    Product.create(name: 'Hollywood', item_desc: 'item 123', price: 199, 
                    status: 0, profile: profilePedro)


  login_as userKihare, scope: :user
  visit root_path
  click_on 'Produtos'
  click_on 'Hollywood'
  click_on 'Comprar'
  
  expect(page).to have_content('Hollywood')
  expect(page).to have_content('item 123')
  expect(page).to have_content('R$ 199,00')
  expect(page).to have_content('Pedro')
  expect(page).to have_content('Kihare')
  expect(page).to_not have_link('Confirmar Compra')
  expect(page).to_not have_link('Cancelar Compra')
  expect(page).to have_link('Voltar')
  expect(page).to have_button('Enviar')
  end
end