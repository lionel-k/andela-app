require 'rails_helper'

RSpec.describe User, type: :model do
  # Associations

  # Validations
  describe '#name' do
    it 'valides an user has a name' do
      user = User.new(name: 'paul')
      expect(user).to be_valid
    end
  end
end
