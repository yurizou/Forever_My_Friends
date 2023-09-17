class Notice < ApplicationRecord
  enum plan_id: { birthday: 0, meet_friend: 1, neglect_friend: 2 }
  
  belongs_to :friend
end

