class User < ActiveRecord::Base
  include Clearance::User

  has_many :discussions, dependent: :destroy
  has_many :collaborations
  has_many :collaborated_discussions, through: :collaborations,
    source: :discussion

  validates :username, presence: true

  def owns?(discussion)
    discussion_ids.include? discussion.id
  end

  def can_collaborate?(discussion)
    !owns?(discussion)
  end
end
