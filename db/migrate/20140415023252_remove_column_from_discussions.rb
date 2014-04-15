class RemoveColumnFromDiscussions < ActiveRecord::Migration
  def change
    remove_column :discussions, :content_id
    remove_column :discussions, :content_type
  end
end
