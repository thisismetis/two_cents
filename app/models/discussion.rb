class Discussion < ActiveRecord::Base
  belongs_to :user

  has_many :comments

  validates :name, presence: true
  validates :user, presence: true
end
