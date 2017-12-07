class RemoveUniquenessOnEditors < ActiveRecord::Migration[5.1]
  def change
    remove_index :poems, :franklin
    remove_index :poems, :johnson
    add_index :poems, :franklin, where: 'poems.franklin IS NOT NULL'
    add_index :poems, :johnson, where: 'poems.johnson IS NOT NULL'
  end
end
