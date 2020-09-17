require 'rails_helper'

RSpec.describe Product, type: :model do

  context 'token' do
    it 'generate on create' do

      user_test = User.create(name: 'Client Test', email: 'test@email.com', 
                               password: '12345678')

      profile_test = Profile.create(name: 'A', sector: 'RH', region: 'SP',
                                    company: 'Box', email: 'test@email.com',
                                    user: user_test)

      product = Product.create(name: 'Abcdefgij', item_desc: 'item 123', price: 199, 
                                status: 0, profile: profile_test)
      


      product.save!
      product.reload

      expect(product.token).to be_present
      expect(product.token.size).to eq(6)
      expect(product.token).to match(/^[A-Z0-9]+$/)
    end
  end

  context 'validation' do
    it 'attributes cannot be blank' do

      product = Product.new
      
      product.valid?

      expect(product.errors[:item_desc]).to include('não pode ficar em branco')
      expect(product.errors[:name]).to include('não pode ficar em branco')
      expect(product.errors[:price]).to include('não pode ficar em branco')
      expect(product.errors[:status]).to include('não pode ficar em branco')
    end

    it 'price cannot be below 0' do
      
      product = Product.new(price: -10)

      product.valid?

      expect(product.errors[:price]).to include('deve ser maior ou igual a 0')
    end

    it 'product name cannot be below 5' do
      
      product = Product.new(name: 'sim')

      product.valid?

      expect(product.errors[:name]).to include('é muito curto (mínimo: 5 caracteres)')
    end

    it 'product name cannot be above 150' do
      
      product = Product.new(name: '0123456789012345678901234567890123456789
                                    012345678901234567890123456789012345678
                                    901234567890123456789012345678901234567
                                    89012345678901234567890123456789')

      product.valid?

      expect(product.errors[:name]).to include('é muito longo (máximo: 150 caracteres)')
    end
  end
end
