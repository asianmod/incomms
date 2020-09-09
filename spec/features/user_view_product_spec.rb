require 'rails_helper'

feature 'User view product list' do
  scenario 'and view list' do

    userPedro = User.create(name: 'Pedro', email: 'pedro@email.com', 
                             password: '123456')

    userLeo = User.create(name: 'Leo', email: 'leo@email.com', 
                           password: '123456')

    userKihare = User.create(name: 'Kihare', email: 'kihare@email.com', 
                             password: '123456')

    Profile.create(name: 'Kihare', sector: 'TI', region: 'SP',
                    company: 'Box', email: 'kihare@email.com',
                    user: userKihare)          

    profilePedro = Profile.create(name: 'Pedro', sector: 'RH', region: 'SP',
                                 company: 'Box', email: 'pedro@email.com',
                                  user: userPedro)

    profileLeo = Profile.create(name: 'Leo', sector: 'Finanças', region: 'RJ',
                                company: 'Pedra', email: 'leo@email.com',
                                user: userLeo)

    Product.create(name: 'Hollywood', item_desc: 'item 123', price: 199, 
                    profile: profilePedro, status: 0)

    Product.create([{ name: 'RiotPoints', item_desc: 'Sim Riot', 
                    price: 50, profile: profileLeo, status: 0},
                    { name: 'ValorantPoints', item_desc: 'Sim Valorant', 
                    price: 300, profile: profileLeo, status: 0}])


    login_as userKihare, scope: :user
    visit root_path
    click_on 'Produtos'

    expect(page).to have_content('Hollywood')
    expect(page).not_to have_content('RiotPoints')
    expect(page).not_to have_content('ValorantPoints')
    expect(page).to have_link('Voltar', href: root_path)
  end

  scenario 'and view details' do
    
    userPedro = User.create(name: 'Pedro', email: 'pedro@email.com', 
                            password: '123456')

    userLeo = User.create(name: 'Leo', email: 'leo@email.com', 
                          password: '123456')

    userKihare = User.create(name: 'Kihare', email: 'kihare@email.com', 
                             password: '123456')

    Profile.create(name: 'Kihare', sector: 'TI', region: 'SP',
                    company: 'Box', email: 'kihare@email.com',
                    user: userKihare)          

    profilePedro = Profile.create(name: 'Pedro', sector: 'RH', region: 'SP',
                                  company: 'Box', email: 'pedro@email.com',
                                  user: userPedro)

    profileLeo = Profile.create(name: 'Leo', sector: 'Finanças', region: 'RJ',
                                company: 'Pedra', email: 'leo@email.com',
                                user: userLeo)

    Product.create(name: 'Hollywood', item_desc: 'item 123', price: 199, 
                    profile: profilePedro, status: 0)

    Product.create([{ name: 'RiotPoints', item_desc: 'Sim Riot', 
                    price: 50, profile: profileLeo, status: 0 },
                    { name: 'ValorantPoints', item_desc: 'Sim Valorant', 
                    price: 300, profile: profileLeo, status: 0 }])


  login_as userKihare, scope: :user
  visit root_path
  click_on 'Produtos'
  click_on 'Hollywood'

  expect(page).to have_content('Hollywood')
  expect(page).to have_content('item 123')
  expect(page).to have_content('R$ 199,00')
  expect(page).to have_content('Pedro')
  end
end