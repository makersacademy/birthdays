class BirthdayList
  def initialize
    @list = []
  end

  def add(name, birthday)
    @list << { name: name, birthday: birthday }
  end
end