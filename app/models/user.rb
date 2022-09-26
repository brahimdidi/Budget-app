class User < ApplicationRecord
  has_many :expenses
  has_many :groups

  validates :name, presence: true

end