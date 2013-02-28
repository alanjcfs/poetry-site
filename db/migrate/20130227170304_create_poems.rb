class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.integer :johnson
      t.text :text

      t.timestamps
    end
  end
end
