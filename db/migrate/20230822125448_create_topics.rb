class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.string :category, null: false
      t.string :article, null: false
      t.timestamps
    end
  end
end
