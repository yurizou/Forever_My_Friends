class Friend < ApplicationRecord

  has_one_attached :image

  belongs_to :genre
  belongs_to :user
  has_many :friend_plans, dependent: :destroy

  enum gender: {
      女性: 1,
      男性: 2,
      未回答: 3
  }

end
