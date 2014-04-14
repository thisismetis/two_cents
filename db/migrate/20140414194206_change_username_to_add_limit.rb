class ChangeUsernameToAddLimit < ActiveRecord::Migration
  def change
    change_column :users, :username, :string, limit: 20, null: false
  end
end
