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
    
  end

  scenario 'must be unique' do
    
  end
end