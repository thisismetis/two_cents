class DiscussionForm
  include ActiveModel::Model

  attr_accessor :name, :type, :subject, :user

  validates :name, presence: true
  validates :type, presence: true
  validates :subject, presence: true
  validates :user, presence: true

  def persist
    content = content_type.create(subject: subject)
    if content.valid?
      content.create_discussion(name: name, user: user)
    end
    content
  end

  private

  def content_type
    type.constantize
  end
end
