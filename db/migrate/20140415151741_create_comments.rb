class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.belongs_to :discussion, index: true
      t.string :username

      t.timestamps
    end
  end
end
