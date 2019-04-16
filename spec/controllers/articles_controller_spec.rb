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
end
