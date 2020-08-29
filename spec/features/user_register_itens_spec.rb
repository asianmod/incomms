require 'rails_helper'

feature 'User register itens' do
  scenario 'from index page' do
    #primeiro as variaveis 

    #navegar até lá 

    #preenche o form 
    visit root_path
    click_on 'Produtos'

    expect(page).to have_link('Catalogar um novo item',
                              href: new_item_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Produtos'
    click_on 'Catalogar um novo item'

    fill_in 'Nome', with: 'Top' 
    fill_in 'Diária', with: '100'
    fill_in 'Seguro do carro', with: '50'
    fill_in 'Seguro para terceiros', with: '10'
    click_on 'Enviar'

    expect(current_path).to eq car_category_path(CarCategory.last)
    expect(page).to have_content('Top')
    expect(page).to have_content('R$ 100,00')
    expect(page).to have_content('R$ 50,00')
    expect(page).to have_content('R$ 10,00')
    expect(page).to have_link('Voltar')
  end
end
