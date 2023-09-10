class Plan < ApplicationRecord
  has_many :friend_plans, dependent: :destroy
  has_many :friends, through: :friend_plans
  belongs_to :user

  enum status: {
     ready: 0, replan: 1, executed: 2, cancel: 3, sudden_cancel: 4
  }

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
