class Discussion < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :user, presence: true
  validates :content, presence: true
end
