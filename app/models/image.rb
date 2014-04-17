class Image < ActiveRecord::Base
  has_one :discussion, as: :content

  has_attached_file :subject,
    styles: { medium: '700x700>' },
    storage: :s3,
    bucket: ENV.fetch('S3_BUCKET_NAME'),
    s3_credentials: {
      access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
    }

  validates_attachment_content_type :subject, content_type: /\Aimage/
  validates_attachment_file_name :subject, matches: [/png\Z/, /jpe?g\Z/]
end