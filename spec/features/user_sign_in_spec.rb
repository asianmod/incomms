require 'rails_helper'

feature 'User sign in' do

  # Objetivo: a partir da tela inicial, ir para a tela de login
  scenario 'from home page' do
    # Arrange
    # Act
    visit root_path
    # Assert
    expect(page).to have_link('Entrar')
  end
  
  scenario 'successfully' do
    # Arrange
    User.create!(name: 'João Almeida', email: 'joao@email.com', 
                 password: '12345678')
    # Act
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'joao@email.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Entrar'

    # Assert
    expect(page).to have_content 'João Almeida'
    expect(page).to have_content 'Login efetuado com sucesso'
    expect(page).to have_link 'Sair'
    expect(page).not_to have_link 'Entrar'
  end
  
  xscenario 'and sign out' do
    # Arrange
    User.create!(name: 'João Almeida', email: 'joao@email.com', 
                 password: '12345678')
    # Cria um user

    # Act
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'joao@email.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Sair'
    # Faz login e .... clica no SAIR

    # Assert
    expect(page).to have_content 'João Almeida'
    expect(page).to have_content 'Logout efetuado com sucesso'
    expect(page).to have_link 'Entrar'
    expect(page).not_to have_link 'Sair'
    # Inverte as expectativas do sign in
  end
end