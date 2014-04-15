class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :name, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
