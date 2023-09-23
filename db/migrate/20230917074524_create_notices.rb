class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.integer "user_id", null: false
      t.integer "friend_id", null: false
      t.integer "plan_id", null: false
      t.timestamps
    end
  end
end
