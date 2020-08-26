require 'rails_helper'

feature 'user fill profile' do

  scenario 'successfully' do
    # Arrange
    User.create!(name: 'João Almeida', email: 'joao@email.com', 
                 password: '12345678')
    # Act
    login_as(user)
    
end