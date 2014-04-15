class User < ActiveRecord::Base
  include Clearance::User

  has_many :discussions
  validates :username, presence: true, uniqueness: true
end
