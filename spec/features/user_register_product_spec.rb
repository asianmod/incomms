require 'rails_helper'

feature 'User register product' do
  scenario 'successfully' do

    userKihare = User.create(name: 'Kihare', email: 'kihare@email.com', 
                              password: '123456')

    Profile.create(name: 'Kihare', sector: 'TI', region: 'SP',
                    company: 'Box', email: 'kihare@email.com',
                    user: userKihare)    

    login_as userKihare, scope: :user                            
    visit root_path
    click_on 'Produtos'
    click_on 'Catalogar um novo item'
    fill_in 'Nome', with: 'Galo de Calça' 
    fill_in 'Descrição do produto', with: 'Galo de calça azul tam. 42.'
    fill_in 'Valor', with: '500'
    click_on 'Confirmar'

    expect(current_path).to eq product_path(Product.last)
    expect(page).to have_content('Galo de Calça')
    expect(page).to have_content('Galo de calça azul tam. 42.')
    expect(page).to have_content('R$ 500,00')
    expect(page).to have_link('Voltar')
  end

  scenario 'cannot be blank' do

    userKihare = User.create(name: 'Kihare', email: 'kihare@email.com', 
                              password: '123456')

    Profile.create(name: 'Kihare', sector: 'TI', region: 'SP',
                    company: 'Box', email: 'kihare@email.com',
                    user: userKihare)    

    login_as userKihare, scope: :user                            
    visit root_path
    click_on 'Produtos'
    click_on 'Catalogar um novo item'
    fill_in 'Nome', with: '' 
    fill_in 'Descrição do produto', with: ''
    fill_in 'Valor', with: ''
    click_on 'Confirmar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Descrição do produto não pode ficar em branco')
    expect(page).to have_content('Valor não pode ficar em branco')
  
  end
end
