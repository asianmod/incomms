require 'rails_helper'

feature 'user confirm trade' do
  scenario 'sucessfully' do
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
            status: 0, profile: profilePedro)

    tradingHollywood = TradingLog.create(seller_id: 2, 
                      product: hollywood, profile: profileKihare, status: 0)

    comentarioKihare = LogComment.create(private_message: 'Coé, tem pra cachorro?', 
                        profile: profileKihare, 
                        trading_log: tradingHollywood)


    login_as userPedro, scope: :user
    visit root_path
    click_on 'Vendas'
    click_on 'Ver detalhes'
    expect(current_path).to eq trading_log_path(tradingHollywood)
    click_on 'Confirmar Venda'

    expect(page).to have_content('Hollywood')
    expect(page).to have_content('Ver detalhes')
    expect(page).to have_link('Voltar')
    expect(page).to have_content('Pedro')
  end

  scenario 'and cancel trade' do
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

    tradingHollywood = TradingLog.create(seller_id: 2, 
                      product: hollywood, profile: profileKihare, status: 0)

    comentarioKihare = LogComment.create(private_message: 'Coé, tem pra cachorro?', 
                        profile: profileKihare, 
                        trading_log: tradingHollywood)


    login_as userPedro, scope: :user
    visit root_path
    click_on 'Vendas'
    click_on 'Ver detalhes'
    click_on 'Cancelar Venda'
        
    expect(page).not_to have_content('Hollywood')
    expect(page).not_to have_link('Ver detalhes')
    expect(page).to have_link('Voltar')
    expect(page).to have_content('Pedro')
  end
end