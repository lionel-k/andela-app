require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  it 'creates an album with valid data' do
    user = User.create(name: 'toto')
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
