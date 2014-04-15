class Content < ActiveRecord::Base
  belongs_to :discussion

  validates :media, presence: true
  validates :url, presence: true
end
