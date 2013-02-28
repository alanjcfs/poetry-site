class AddTitleToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :title, :string
  end
end
