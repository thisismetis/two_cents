class Document < ActiveRecord::Base
  has_one :discussion, as: :content

  has_attached_file :subject,
    storage: :s3,
    bucket: ENV.fetch('S3_BUCKET_NAME'),
    s3_credentials: {
      access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
    }

  validates_attachment :subject, presence: true

  validates_attachment_content_type :subject,
    :content_type => %w(application/pdf)

  validate :check_content_for_errors

  private

  def check_content_for_errors
    if !['application/pdf'].include?(subject_content_type)
      errors.add(:subject_custom_errors, "'#{subject_file_name}' is not a valid document type")
    end

    if subject_file_size > 20971520
      errors.add(:subject_custom_errors, "'#{subject_file_name}' is larger than 20MB.")
    end
  end
end
