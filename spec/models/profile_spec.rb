require 'rails_helper'

RSpec.describe Profile, type: :model do
  
  context 'validation' do
    it 'cannot be blank' do
      
      profile = Profile.new

      profile.valid?

      expect(profile.errors[:name]).to include('não pode ficar em branco')
      expect(profile.errors[:sector]).to include('não pode ficar em branco')
      expect(profile.errors[:region]).to include('não pode ficar em branco')
      expect(profile.errors[:email]).to include('não pode ficar em branco')
      expect(profile.errors[:company]).to include('não pode ficar em branco')
    end

    it 'name cannot be below 2' do
      
      profile = Profile.new(name: 'a')

      profile.valid?

      expect(profile.errors[:name]).to include('é muito curto (mínimo: 2 caracteres)')
    end

    it 'name cannot be above 150' do
      
      profile = Profile.new(name: '0123456789012345678901234567890123456789
                                    012345678901234567890123456789012345678
                                    901234567890123456789012345678901234567
                                    89012345678901234567890123456789')
      
      profile.valid?

      expect(profile.errors[:name]).to include('é muito longo (máximo: 150 caracteres)')
    end
  end

  context 'uniqueness' do
    it 'must be unique' do

      userPaulo = User.create!(name: 'Paulo', email: 'paulo@email.com', password: '123456')
      
      Profile.create!(name: 'Paulo', sector: 'RH', region: 'SP', company: 'Box',
                      email: 'paulo@email.com', user: userPaulo)

      profile = Profile.new(email: 'paulo@email.com')

      profile.valid?

      expect(profile.errors[:email]).to include('já está em uso')
    end
  end
end