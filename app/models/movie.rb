class Movie < ApplicationRecord
  has_many :nominations, dependent: :destroy
  has_many :users, through: :nominations
end
