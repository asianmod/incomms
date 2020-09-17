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
    fill_in 'Comentário', with: 'Coé, tem pra cachorro?'
    click_on 'Enviar'

    expect(page).to have_content('Hollywood')
    expect(page).to have_content('item 123')
    expect(page).to have_content('R$ 199,00')
    expect(page).to have_content('Pedro')
    expect(page).to have_content('Kihare')
    expect(page).to have_content('Coé, tem pra cachorro?')
  end

  scenario 'seller reply' do

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
                                status: 5, profile: profilePedro)

    tradingHollywood = TradingLog.create(seller_id: 2, product: hollywood,
                                profile: profileKihare)

    comentarioKihare = LogComment.create(private_message: 'Coé, tem pra cachorro?', 
                              profile: profileKihare, trading_log: tradingHollywood)

                              
    login_as userPedro, scope: :user
    visit root_path
    click_on 'Vendas'
    expect(current_path).to eq trading_logs_path
    click_on 'Ver detalhes'
    expect(current_path).to eq trading_log_path(tradingHollywood)
    fill_in 'Comentário', with: 'Não, só ariranha ferroviária.'
    click_on 'Enviar'

    expect(page).to have_content('Hollywood')
    expect(page).to have_content('item 123')
    expect(page).to have_content('R$ 199,00')
    expect(page).to have_content('Kihare')
    expect(page).to have_content('Coé, tem pra cachorro?')
    expect(page).to have_content('Pedro')
    expect(page).to have_content('Não, só ariranha ferroviária.')
  end

  scenario 'comment too short' do
    
    
  end
end