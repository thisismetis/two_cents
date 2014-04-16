class PushUpdate
  def initialize(subject)
    @subject = subject
  end

  def push_update
    if subject.valid?
      Pusher['comments_updater'].trigger('comment_event',
        username: subject.username,
        body: subject.body,
        created_at: subject.created_at
      )
    end
  end

  private
  attr_reader :subject
end
