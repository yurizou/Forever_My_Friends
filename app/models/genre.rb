class Genre < ApplicationRecord
  belongs_to :user
  has_many :friends, dependent: :destroy
end
