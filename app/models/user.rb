class User < ApplicationRecord
  validates :name, presence: true, allow_blank: false

  has_many :articles

  def as_json(options={})
    super(:only => [:name],
    )
  end
end
