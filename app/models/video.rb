class Video < ActiveRecord::Base
  has_one :discussion, as: :content

  validate :check_if_youtube_video

  def youtube_video_id
    subject.split("=")[1]
  end

  private

  def check_if_youtube_video
    unless subject.include?("youtube.com")
      errors.add(:subject, "must be a URL from YouTube")
    end
  end
end
