require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Validations' do
    it 'has a title and a content' do
      user = User.create(name: 'paul')
      article = Article.new(title: 'The article',
        content: 'awesome article',
        user: user)

      expect(article).to be_valid
    end
  end
end
