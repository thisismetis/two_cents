class AddContentTypeToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :content_type, :string
    add_column :discussions, :content_id, :integer

    add_index :discussions, [:content_id, :content_type]

  end
end
