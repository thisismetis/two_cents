class Image < ActiveRecord::Base
  has_one :discussion, as: :content, dependent: :destroy

  has_attached_file :subject,
    styles: { medium: '700x700>' },
    storage: :s3,
    bucket: ENV.fetch('S3_BUCKET_NAME'),
    s3_credentials: {
      access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
    }

  validates_attachment :subject, presence: true,
    size: {
      in: 0..20480.kilobytes,
      message: 'must be under 20MB in size.'
    },
    file_name: {
      matches: [
        /gif\Z/,
        /png\Z/,
        /jpe?g\Z/
      ],
      message:
        'needs to be one of these extensions: png, gif, or jp(e)g.'
    }
end
