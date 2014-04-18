class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :subject, null: false

      t.timestamps
    end
  end
end
