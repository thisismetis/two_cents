class Guest
  attr_reader :username

  def initialize(username="")
    @username = username
  end

  def owns?(arg)
    false
  end
end
