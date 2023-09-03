class Plan < ApplicationRecord
  has_many :friend_plans, dependent: :destroy
end
