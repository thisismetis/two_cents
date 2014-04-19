class Discussion < ActiveRecord::Base
  before_create :generate_token

  belongs_to :user
  belongs_to :content, polymorphic: true

  has_many :comments, dependent: :destroy

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
