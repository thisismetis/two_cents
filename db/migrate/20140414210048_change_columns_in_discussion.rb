class ChangeColumnsInDiscussion < ActiveRecord::Migration
  def change
    change_column :discussions, :user_id, :integer, null: false
    change_column :discussions, :name, :string, null: false
  end
end
