class AddFranklinToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :franklin, :integer
    add_index :poems, :franklin, unique: true

    # Johnson didn't have unique set, we set it here to ensure uniqueness.
    remove_index :poems, :johnson
    add_index :poems, :johnson, unique: true
  end
end
