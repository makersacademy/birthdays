class Birthday
  def initialize
    @birthday = []
  end

  def store(name, birthday)
    @birthday << {name: name, birthday: birthday}
    {name: name, birthday: birthday}
  end

  def show
    @birthday.each do |hash|
      puts "#{hash[:name]}'s birthday is on #{hash[:birthday]}"
    end
  end
end