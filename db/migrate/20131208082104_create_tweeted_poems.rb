class CreateTweetedPoems < ActiveRecord::Migration
  def change
    create_table :tweeted_poems do |t|
      t.integer :poem_id
      t.integer :count

      t.timestamps
    end
  end
end
