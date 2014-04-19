class Audio < ActiveRecord::Base
  has_one :discussion, as: :content

  has_attached_file :subject,
    storage: :s3,
    bucket: ENV.fetch('S3_BUCKET_NAME'),
    s3_credentials: {
      access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
    }

  validates_attachment :subject, presence: true,
    size: {
      in: 0..61440.kilobytes,
      message: 'must be under 60MB in size.'
    },
    file_name: {
      matches: [
        /mp3\Z/,
        /ogg\Z/,
        /wav\Z/
      ],
      message:
        'needs to be one of these extensions: mp3, ogg, or wav.'
    }
end
