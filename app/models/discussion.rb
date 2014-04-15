class Discussion < ActiveRecord::Base
  require 'base64'
  belongs_to :user

  validates :name, presence: true
  validates :user, presence: true

  def to_param
    Base64.encode64(id.to_s)
  end

  def self.find(id)
    decoded_id = Base64.decode64(id)
    super(decoded_id)
  end
end
