class Code < ActiveRecord::Base
  before_create :extract_gist_id
  has_one :discussion, as: :content

  validate :check_if_real_gist_url

  private

  def check_if_real_gist_url
    unless subject.split("/")[2] == "gist.github.com"
      errors.add(:subject, "must be a URL from gist.github.com")
    end
  end

  def extract_gist_id
    self.subject = self.subject.split("/").last
  end
end
