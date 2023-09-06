class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.integer :friend_id, null: false
      t.integer :user_id, null: false
      t.string :title, null: false
      t.datetime :plan_date, null: false
      t.string :place, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
