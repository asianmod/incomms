require 'rails_helper'

feature 'User register itens' do
  scenario 'from index page' do
  
    visit root_path
    click_on 'Produtos'

    expect(page).to have_link('Catalogar um novo item',
                              href: new_product_path)
  end

  scenario 'successfully' do
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
end
