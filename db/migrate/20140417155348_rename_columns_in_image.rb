class RenameColumnsInImage < ActiveRecord::Migration
  def change
    rename_column :images, :photo_file_name, :subject_file_name
    rename_column :images, :photo_content_type, :subject_content_type
    rename_column :images, :photo_file_size, :subject_file_size
    rename_column :images, :photo_updated_at, :subject_updated_at
  end
end
