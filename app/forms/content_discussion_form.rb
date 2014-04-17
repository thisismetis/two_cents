class ContentDiscussionForm
  include ActiveModel::Model

  attr_accessor(
    :name,
    :type,
    :subject,
    :user
  )

  def persist
    content = content_type.create(subject: subject)
    content.create_discussion(name: name, user: user)
  end

  private

  def content_type
    type.constantize
  end
end
