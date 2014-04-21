class User < ActiveRecord::Base
  include Clearance::User

  has_many :discussions, dependent: :destroy
  has_many :collaborations

  validates :username, presence: true

  def owns?(discussion)
    discussion_ids.include? discussion.id
  end
end
