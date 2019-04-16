require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "GET #create" do
    it 'creates an album with valid data' do
      user = User.create(name: 'toto')
      @request.headers['X-User-Token'] = user.authentication_token
      post :create, params: {
                          article: {
                                  content: 'awesome content',
                                  title: 'title',
                                  user_id: user.id
                                }
                          }

      json = JSON.parse(response.body)
      expect(json['content']).to eq('awesome content')
      expect(json['title']).to eq('title')
      expect(json['user_id']).to eq(user.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE #destroy" do
    it 'deletes an article' do
      user = User.create(name: 'toto')
      article = Article.create(title: 'title',
        content: 'content',
        user: user)
      article_id = article.id

      delete 'destroy', params: { id: article_id }

      expect(response.body).to be_empty
      expect(response).to have_http_status(204)
      expect(Article.ids).not_to include article_id
    end
  end

  describe 'GET #index' do
    it 'shows all articles' do
      user = User.create!(name: 'roger')
      another_user = User.create!(name: 'other_user')
      5.times do |i|
        Article.create!(title: "title-#{i}",
          content: "content-#{i}",
          user: user)
      end

      5.times do |i|
        Article.create!(title: "title-#{i}",
          content: "content-#{i}",
          user: another_user)
      end

      get :index

      json = JSON.parse(response.body)
      expect(json.size).to eq(10)
      expect(response).to have_http_status(200)
    end
  end
end
