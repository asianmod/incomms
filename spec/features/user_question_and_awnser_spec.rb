require 'rails_helper'

feature 'User question and awnser' do
  
  scenario 'user do question' do
    
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
                   profile: profilePedro, status: 0)


    login_as userKihare, scope: :user
    visit root_path
    click_on 'Produtos'
    click_on 'Hollywood'
    fill_in 'Comentário', with: 'Azul?'
    click_on 'Enviar'

    expect(page).to have_content('Hollywood')
    expect(page).to have_content('item 123')
    expect(page).to have_content('R$ 199,00')
    expect(page).to have_content('Pedro')
    expect(page).to have_content('Kihare')
    expect(page).to have_content('Azul?')
  end

  scenario 'user awnser question' do
    
    userPedro = User.create(name: 'Pedro', email: 'pedro@email.com', 
                            password: '123456')

    userKihare = User.create(name: 'Kihare', email: 'kihare@email.com', 
                              password: '123456')

    profileKihare = Profile.create(name: 'Kihare', sector: 'TI', region: 'SP',
                                   company: 'Box', email: 'kihare@email.com',
                                   user: userKihare)          

    profilePedro = Profile.create(name: 'Pedro', sector: 'RH', region: 'SP',
                                  company: 'Box', email: 'pedro@email.com',
                                  user: userPedro)

    hollywood = Product.create(name: 'Hollywood', item_desc: 'item 123', price: 199, 
                                profile: profilePedro, status: 0)
        
    Comment.create(replay: 'Azul?', profile: profileKihare, product: hollywood)    

    login_as userPedro, scope: :user
    visit root_path
    click_on 'Produtos'
    click_on 'Hollywood'
    fill_in 'Comentário', with: 'Não, tabaco.'
    click_on 'Enviar'
    
    expect(page).to have_content('Hollywood')
    expect(page).to have_content('item 123')
    expect(page).to have_content('R$ 199,00')
    expect(page).to have_content('Kihare')
    expect(page).to have_content('Azul?')
    expect(page).to have_content('Pedro')
    expect(page).to have_content('Não, tabaco.')
  end

  scenario 'has no comment' do

    userLeo = User.create(name: 'Leo', email: 'leo@email.com', 
                           password: '123456')

    profileLeo = Profile.create(name: 'Leo', sector: 'Finanças', region: 'RJ',
                                company: 'Pedra', email: 'leo@email.com',
                                user: userLeo)

    Product.create([{ name: 'RiotPoints', item_desc: 'Sim Riot', 
                    price: 50, profile: profileLeo, status: 0 },
                    { name: 'ValorantPoints', item_desc: 'Sim Valorant', 
                    price: 300, profile: profileLeo, status: 5 }])

    
    login_as userLeo, scope: :user
    visit root_path
    click_on 'Produtos'
    click_on 'RiotPoints'
    
    expect(page).to have_content('RiotPoints')
    expect(page).to have_content('Sim Riot')
    expect(page).to have_content('R$ 50,00')
    expect(page).to have_content('Leo')
    expect(page).to have_content('Não há comentários')
    
  end
end