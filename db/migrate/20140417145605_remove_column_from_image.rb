class RemoveColumnFromImage < ActiveRecord::Migration
  def change
     remove_column :images, :discussion_id, :integer
  end
end
