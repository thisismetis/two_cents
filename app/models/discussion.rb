class Discussion < ActiveRecord::Base
  belongs_to :user


  has_many :comments
  belongs_to :content, polymorphic: true

  validates :name, presence: true
  validates :user, presence: true

  
end
