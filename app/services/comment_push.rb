class CommentPush
  def initialize(comment)
    @comment = comment
  end

  def push_comment_update
    if comment.valid?
      Pusher['comments_updater'].trigger('comment_event',
        username: comment.username,
        body: comment.body,
        created_at: comment.created_at
      )
    end
  end

  private
  attr_reader :comment
end
