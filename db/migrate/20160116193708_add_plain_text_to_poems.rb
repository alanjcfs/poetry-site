class AddPlainTextToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :plain_text, :text
  end
end
