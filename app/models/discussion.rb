class Discussion < ActiveRecord::Base
  before_create :generate_token

  belongs_to :user
  belongs_to :content, polymorphic: true

  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :user, presence: true

  def self.open
    where(closed: false)
  end

  def self.closed
    where(closed: true)
  end

  def to_param
    token
  end

  def close
    update(closed: true)
  end

  def open?
    !closed
  end

  private

  def generate_token
    self.token = SecureRandom.hex(8)
    while Discussion.exists?(token: token)
      self.token = SecureRandom.hex(8)
    end
  end

end
