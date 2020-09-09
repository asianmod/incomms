require 'rails_helper'

RSpec.describe Product, type: :model do

  context 'token' do
    it 'generate on create' do

      user_test = User.create(name: 'Client Test', email: 'test@email.com', 
                               password: '12345678')

      profile_test = Profile.create(name: 'A', sector: 'RH', region: 'SP',
                                    company: 'Box', email: 'test@email.com',
                                    user: user_test)

      product = Product.create(name: 'A', item_desc: 'item 123', price: 199, 
                                profile: profile_test)
      


      product.save!
      product.reload

      expect(product.token).to be_present
      expect(product.token.size).to eq(6)
      expect(product.token).to match(/^[A-Z0-9]+$/)
    end
  end
end
