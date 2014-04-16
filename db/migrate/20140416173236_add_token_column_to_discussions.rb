class AddTokenColumnToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :token, :string, null: false
  end
end
