class BirthdayList
  DEFAULT_FORMAT = "%d/%m/%Y"
  private
  attr_reader :birthdays
  public

  def initialize
    @birthdays = []
  end

  def store birthday
    birthdays << birthday
  end

  def show
    return if birthdays.empty?
    puts "Name".ljust(30) + "Birthday"
    birthdays.each do |birthday|
      puts birthday.display_string
    end
    return
  end

  def check_today
    birthdays.each do |birthday|
      if birthday.today?
        message = "It's #{birthday.name}'s birthday today!"
        message << " They are #{birthday.age} years old!"
        puts message
      end
    end
    return
  end
end
