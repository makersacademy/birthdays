class BirthdayList

  def initialize
    @birthday_list = Hash.new
  end

  def add(name, dob)
    @birthday_list[name] = dob
    puts "#{name} has been added to the list!"
  end

  def print_list
    @birthday_list.collect do |name, dob|
      puts "#{name}: #{dob}"
    end
  end

end
