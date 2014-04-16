class Discussion < ActiveRecord::Base
  belongs_to :user
  before_create :generate_token
  has_many :comments

  validates :name, presence: true
  validates :user, presence: true
  validates :token, presence: true, uniqueness: true

  has_attached_file :photo, styles: { medium: '700x700>' }
  validates_attachment_content_type :photo, content_type: /\Aimage/
  validates_attachment_file_name :photo, matches: [/png\Z/, /jpe?g\Z/]

  def to_param
    self.token
  end

  private

  def generate_token
    self.token = SecureRandom.hex(8)
  end
end


