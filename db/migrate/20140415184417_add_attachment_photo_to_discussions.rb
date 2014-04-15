class AddAttachmentPhotoToDiscussions < ActiveRecord::Migration
  def change
    add_attachment :discussions, :photo
  end
end
