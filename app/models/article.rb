class Article < ApplicationRecord
  validates :title, :content, presence: true, allow_blank: false

  belongs_to :user
end
