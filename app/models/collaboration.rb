class Collaboration < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :user

  validates :discussion_id,
    uniqueness: { scope: :user_id}
end
