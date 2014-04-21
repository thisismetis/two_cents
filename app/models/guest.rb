class Guest
  attr_reader :username

  def initialize(username="")
    @username = username
  end

  def owns?(discussion)
    false
  end

  def can_collaborate?(discussion)
    false
  end
end
