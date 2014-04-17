class AddDiscussionIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :discussion_id, :integer, null: false
  end
end
