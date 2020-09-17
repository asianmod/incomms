require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  context 'profile' do
    it 'attributes cannot be blank' do
      comment = Comment.new

      comment.valid?

      expect(comment.errors[:replay]).to include('não pode ficar em branco')
      expect(comment.errors[:profile_id]).to include('não pode ficar em '\
                                                      'branco')
      expect(comment.errors[:product_id])
        .to include('não pode ficar em branco')
    end
  end
end