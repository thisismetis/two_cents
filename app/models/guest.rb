class Guest
  attr_reader :name

  def initialize(name="")
    @name = name
  end

  def username
    name
  end
end
