class ChangeNullStatusOnContent < ActiveRecord::Migration
  def change
    remove_column :contents, :media, :string
  end
end
