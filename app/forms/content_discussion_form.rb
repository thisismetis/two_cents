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
    if content.valid?
      content.create_discussion(name: name, user: user)
      content
    else
      content
    end
  end

  private

  def content_type
    type.constantize
  end
end
