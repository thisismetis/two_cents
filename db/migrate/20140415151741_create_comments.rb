class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.belongs_to :discussion, index: true, null: false
      t.string :username, null: false

      t.timestamps
    end
  end
end
