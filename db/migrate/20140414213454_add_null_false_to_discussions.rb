class AddNullFalseToDiscussions < ActiveRecord::Migration
  def change
    change_column :discussions, :content_id, :integer, null: false
    change_column :discussions, :content_type, :string, null: false
  end
end
