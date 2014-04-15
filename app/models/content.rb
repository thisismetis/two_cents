class Content < ActiveRecord::Base
  belongs_to :discussion

  validates :url, presence: true
end
