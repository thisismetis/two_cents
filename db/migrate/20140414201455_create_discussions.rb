class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.belongs_to :content, index: true, polymorphic: true

      t.timestamps
    end
  end
end
