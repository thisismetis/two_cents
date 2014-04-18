class Code < ActiveRecord::Base
  has_one :discussion, as: :content

  validate :check_if_real_gist_url

  def gist_id
    subject.split("/").last
  end

  private

  def check_if_real_gist_url
    unless subject.split("/")[2] == "gist.github.com"
      errors.add(:subject, "must be a URL from gist.github.com")
    end
  end

end
