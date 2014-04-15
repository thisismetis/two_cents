class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.belongs_to :discussion, index: true
      t.string :media, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
