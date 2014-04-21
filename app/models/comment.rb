class Comment < ActiveRecord::Base
  belongs_to :discussion

  def self.recent
    order(created_at: :asc)
  end
end
