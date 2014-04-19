class User < ActiveRecord::Base
  include Clearance::User

  has_many :discussions, dependent: :destroy

  validates :username, presence: true
end
