class AddIndexToPoems < ActiveRecord::Migration
  def change
    add_index :poems, :johnson
  end
end
