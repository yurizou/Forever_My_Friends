class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.integer :genre_id, null: false
      t.integer :user_id, null: false
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :nickname
      t.string :telephone_number
      t.date :birthday
      t.string :hobby
      t.integer :gender, default: 0
      t.timestamps
    end
  end
end
