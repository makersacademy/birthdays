class BirthdayList
  attr_reader :list

  def initialize
    @list = Hash.new { |h, k| h[k] = [] }
  end
  
  def add birthday
    @list[birthday.date] << birthday.name
    "Added birthday for #{birthday.name}"
  end

  def today
    todays = @list.select do |k, v|
      k.month == Date.today.month && k.day == Date.today.day
    end

    str = "Today's Birthdays:\n"

    todays.each_pair do |birthday, names|
      names.each do |name|
        age = Date.today.year - birthday.year
        str = str + "#{name} is #{age} today!\n"
      end
    end

    str.chomp
  end
end
