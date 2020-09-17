require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  context 'profile' do
    it 'attributes cannot be blank' do
      
      comment = Comment.new

      comment.valid?

      expect(comment.errors[:replay]).to include('não pode ficar em branco')
    end

    it 'comment cannot be above 200' do
      
      comment = Comment.new(replay: '01234567890123456789012345678901234567890123456789
                                    012345678901234567890123456789012345678901234567890
                                    012345678901234567890123456789012345678901234567890
                                    012345678901234567890123456789012345678901234567890')

      comment.valid?

      expect(comment.errors[:replay]).to include
      ('é muito longo (máximo: 200 caracteres)')
    end

    it 'comment cannot be below 2' do
      
      comment = Comment.new(replay: 'a')
  
      comment.valid?
      
      expect(comment.errors[:replay]).to include('é muito curto (mínimo: 2 caracteres)')
    end
  end
end