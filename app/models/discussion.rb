class Discussion < ActiveRecord::Base
  belongs_to :user

  has_many :contents

  validates :name, presence: true
  validates :user, presence: true
end
