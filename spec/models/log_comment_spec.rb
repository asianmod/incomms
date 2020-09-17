require 'rails_helper'

RSpec.describe LogComment, type: :model do
  
  context 'comment' do
    it 'comment cannot be blank' do
      
      log_comment = LogComment.new

      log_comment.valid?

      expect(log_comment.errors[:private_message]).to include('não pode ficar em branco')
    end

    it 'comment cannot be above 300' do
      
      log_comment = LogComment.new(private_message: '0123456789012345678901234567890123456
                                                    78901234567890123456789012345678901234
                                                    56789012345678901234567890123456789012
                                                    34567890123456789012345678901234567890
                                                    12345678901234567890123456789012345678
                                                    90123456789012345678901234567890123456
                                                    78901234567890123456789012345678901234
                                                    56789012345678901234567890123456789012
                                                    34567890123456789012345678901234567890
                                                    12345678901234567890123456789012345678
                                                    901234567890123456789')

      log_comment.valid?

      expect(log_comment.errors[:private_message]).to include
      ('é muito longo (máximo: 300 caracteres)')
    end

    it 'comment cannot be below 2' do
      
      log_comment = LogComment.new(private_message: 'a')

      log_comment.valid?

      expect(log_comment.errors[:private_message]).to include
      ('é muito curto (mínimo: 2 caracteres)')
    end
  end
end
