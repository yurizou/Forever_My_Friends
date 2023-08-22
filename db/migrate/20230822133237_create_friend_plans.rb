class CreateFriendPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_plans do |t|
      t.integer :plan_id, null: false
      t.integer :friend_id, null: false
      t.timestamps
    end
  end
end
