class CreateTweetedPoems < ActiveRecord::Migration
  def change
    create_table :tweeted_poems do |t|
      t.integer :poem_id
      t.integer :count, default: 0

      t.timestamps null: false
    end
    add_index :tweeted_poems, :poem_id
  end
end
