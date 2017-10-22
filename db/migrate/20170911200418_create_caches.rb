class CreateCaches < ActiveRecord::Migration[4.2]
  def change
    create_table :caches do |t|
      t.text :key, null: false
      t.jsonb :data
      t.jsonb :options

      t.timestamps null: false
    end

    add_index :caches, :key, unique: true
  end
end
