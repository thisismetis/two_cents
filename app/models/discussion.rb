class Discussion < ActiveRecord::Base
  belongs_to :user
  before_create :generate_token
  has_many :comments
  belongs_to :content, polymorphic: true

  validates :name, presence: true
  validates :user, presence: true

  def to_param
    token
  end

  private

  def generate_token
    self.token = SecureRandom.hex(8)
    while Discussion.exists?(token: token)
      self.token = SecureRandom.hex(8)
    end
  end
end
