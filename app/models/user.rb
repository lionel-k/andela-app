class User < ApplicationRecord
  validates :name, presence: true, allow_blank: false

  has_many :articles
end
