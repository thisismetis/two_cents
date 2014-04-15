class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.belongs_to :discussion, index: true

      t.timestamps
    end
  end
end
