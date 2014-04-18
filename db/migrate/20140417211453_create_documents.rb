class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :subject_file_name
      t.string :subject_content_type
      t.integer :subject_file_size
      t.datetime :subject_updated_at

      t.timestamps
    end
  end
end
