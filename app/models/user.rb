class User < ActiveRecord::Base
  include Clearance::User

  validates :username, presence: true, uniqueness: true

  has_many :discussions
end
