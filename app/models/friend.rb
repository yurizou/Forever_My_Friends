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
  # def self.looks(search, word)
  #   if search == "perfect_match"
  #     @friend = Friend.where("genre_id LIKE?", "#{word}")
  #   elsif search == "forward_match"
  #     @friend = Friend.where("last_name LIKE?","#{word}%")
  #   elsif search == "backward_match"
  #     @friend = Friend.where("first_name LIKE?","%#{word}")
  #   elsif search == "partial_match"
  #     @friend = Friend.where("last_name_kana LIKE?","%#{word}%")
  #   elsif search == "forward_match"
  #     @friend = Friend.where("first_name_kana LIKE?","#{word}%")
  #   elsif search == "backward_match"
  #     @friend = Friend.where("nickname LIKE?","%#{word}")
  #   elsif search == "partial_match"
  #     @friend = Friend.where("birthday LIKE?","%#{word}%")
  #   elsif search == "forward_match"
  #     @friend = Friend.where("hobby LIKE?","#{word}%")
  #   elsif search == "backward_match"
  #     @friend = Friend.where("gender LIKE?","%#{word}")
  #   else
  #     @friend = Friend.all
  #   end
  # end
  # 検索方法分岐
 end
