class Comment < ActiveRecord::Base
  belongs_to :discussion
  after_save :push_update

  def push_update
    Pusher['test_channel'].trigger('my_event',
      username: username,
      body: body,
      created_at: created_at
    )
  end
end
