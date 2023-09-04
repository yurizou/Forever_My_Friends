class Plan < ApplicationRecord
  has_many :friend_plans, dependent: :destroy
  belongs_to :user
  
  # 検索方法分岐
  # def self.looks(search, word)
  #   if search == "perfect_match"
  #     @plan = Plan.where("title LIKE?", "#{word}")
  #   elsif search == "forward_match"
  #     @plan = Plan.where("plan_date LIKE?","#{word}%")
  #   elsif search == "backward_match"
  #     @plan = Plan.where("place LIKE?","%#{word}")
  #   elsif search == "partial_match"
  #     @plan = Plan.where("status LIKE?","%#{word}%")
  #   else
  #     @plan = Plan.all
  #   end
  # end

end
