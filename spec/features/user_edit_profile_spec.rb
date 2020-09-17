require 'rails_helper'

feature 'user fill profile' do
  scenario 'successfully' do
  
  userPedro = User.create(name: 'Pedro', email: 'pedro@email.com', 
                          password: '123456')
    
  profilePedro = Profile.create(name: 'Pedro', sector: 'RH', region: 'SP',
                                company: 'Box', email: 'pedro@email.com',
                                user: userPedro)

    
  login_as userPedro, scope: :user
  visit root_path
  click_on 'Editar Perfil'
  fill_in 'Nome', with: 'Alpaca Quadrada'
  fill_in 'Setor', with: 'RH'
  fill_in 'Região', with: 'SP'
  fill_in 'Empresa', with: 'Boxbox'
  click_on 'Salvar'

  expect(page).to have_content('Alpaca Quadrada')
  expect(page).to have_content('RH')
  expect(page).to have_content('SP')
  expect(page).to have_content('Boxbox')
  end

  scenario 'cannot be blank' do
  
    userPedro = User.create(name: 'Pedro', email: 'pedro@email.com', 
                            password: '123456')

    profilePedro = Profile.create(name: 'Pedro', sector: 'RH', region: 'SP',
                                  company: 'Box', email: 'pedro@email.com',
                                  user: userPedro)


    login_as userPedro, scope: :user
    visit root_path
    click_on 'Editar Perfil'
    fill_in 'Nome', with: ''
    fill_in 'Setor', with: ''
    fill_in 'Região', with: ''
    fill_in 'Empresa', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Setor não pode ficar em branco')
    expect(page).to have_content('Região não pode ficar em branco')
    expect(page).to have_content('Empresa não pode ficar em branco')
    expect(page).to have_content('Nome é muito curto (mínimo: 1 caracter)')
  end

  scenario 'email must be unique' do
  
    userPedro = User.create(name: 'Pedro', email: 'pedro@email.com', 
      password: '123456')

    profilePedro = Profile.create(name: 'Pedro', sector: 'RH', region: 'SP',
            company: 'Box', email: 'pedro@email.com',
            user: userPedro)  

    userKihare = User.create(name: 'Kihare', email: 'kihare@email.com', 
              password: '123456')

    profileKihare = Profile.create(name: 'Kihare', sector: 'TI', region: 'SP',
                  company: 'Box', email: 'kihare@email.com',
                  user: userKihare)    
    
                  
    login_as userKihare, scope: :user
    visit root_path
    click_on 'Editar Perfil'
    fill_in 'Email', with: 'pedro@email.com'
    click_on 'Salvar'
  
    expect(page).to have_content('Email já está em uso')
  end
end