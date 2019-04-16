require 'rails_helper'

RSpec.describe User, type: :model do
  # Associations

  describe '#articles' do
    it 'has many articles' do
      user = User.create(name: 'paul')
      5.times do |i|
        Article.create!(title: "article-#{i}",
          content: "content-#{i}",
          user: user)
      end

      expect(user.articles).to eq(Article.where(user: user))
    end
  end

  # Validations
  describe '#name' do
    it 'valides an user has a name' do
      user = User.new(name: 'paul')
      expect(user).to be_valid
    end
  end
end
