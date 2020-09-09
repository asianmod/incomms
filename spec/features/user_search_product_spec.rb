require 'rails_helper'

feature 'user searches product' do
  scenario 'and find one match' do

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

  produtoHollywood = Product.create(name: 'Hollywood', item_desc: 'item 123',
                                     price: 199, profile: profilePedro)

                                     
  login_as userKihare, scope: :user
  visit root_path
  click_on 'Produtos'
  fill_in 'Busque aqui!', with: produtoHollywood.token
  click_on 'Buscar'

  expect(page).to have_content(produtoHollywood.token)
  expect(page).to have_content(profilePedro.name)
  expect(page).to have_link('Voltar')
  end
end