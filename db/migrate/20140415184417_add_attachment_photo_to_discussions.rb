class AddAttachmentPhotoToDiscussions < ActiveRecord::Migration
  def self.up
    change_table :discussions do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :discussions, :photo
  end
end
