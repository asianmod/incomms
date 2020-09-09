require 'rails_helper'

feature 'User sign in' do

  scenario 'from home page' do

    visit root_path
    expect(page).to have_link('Entrar')
    
  end
  
  scenario 'successfully' do

    User.create!(name: 'Client Test', email: 'test@email.com', 
                 password: '12345678')
    
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Login'

    expect(page).to have_content('Client Test')
    expect(page).to have_content('Login efetuado com sucesso')
    expect(page).to have_link('Sair')
    expect(page).not_to have_link('Entrar')

  end
  
  scenario 'and sign out' do
    
    User.create!(name: 'Client Test', email: 'test@email.com', 
                 password: '12345678')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Login'
    click_on 'Sair'
    
    
    expect(page).not_to have_content('Client Test')
    expect(page).to have_link('Entrar')
    expect(page).not_to have_link('Sair')
    
  end
end  