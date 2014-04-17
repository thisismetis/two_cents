class RemoveUnusefulFieldsFromDiscussions < ActiveRecord::Migration
  def change
    remove_column :discussions, :photo_file_name, :string
    remove_column :discussions, :photo_content_type, :string
    remove_column :discussions, :photo_file_size, :integer
    remove_column :discussions, :photo_updated_at, :datetime
  end
end
