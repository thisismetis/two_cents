class Document < ActiveRecord::Base
  has_one :discussion, as: :content, dependent: :destroy

  has_attached_file :subject,
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
        /xlsx?\Z/,
        /te?xt\Z/,
        /rtf\Z/,
        /pptx?\Z/,
        /keynote\Z/,
        /pages\Z/,
        /numbers\Z/,
        /pdf\Z/,
        /docx?\Z/
      ],
      message:
        'needs to be one of these extensions: pdf, doc(x), xls(x), t(e)xt, ppt(x), rtf, keynote, pages, or numbers.'
    }
end
