class Birthday

  def initialize
    @birthdays = {}
  end

  def add_birthday(name, dob)
    @birthdays[name] = dob
    return "Name stored!"
  end

  def check_birthdays
    return @birthdays
  end

  def how_old(name)
    dob = @birthdays[name].split(' ').map(&:to_i)
    require 'date'
    date = Date.today.to_s.split('-').reverse.map(&:to_i)
    birthdaygone = date[2] - dob[2]
    notyetgone = date[2] - dob[2] - 1
    if date[1] > dob[1]
      birthdaygone
    elsif date[1] < dob[1]
      notyetgone
    else
      date[0] >= dob[0] ? birthdaygone : notyetgone
    end
  end

  def whose_birthday
    birthdaytoday = false
    require 'date'
    date = Date.today.to_s.split('-').reverse.map(&:to_i)
    @birthdays.each { |name, dob|
      dob = dob.split(' ').map(&:to_i)
      if date[0] == dob[0] && date[1] == dob[1]
        birthdaytoday = true
        return "#{name} is #{how_old(name)} years old today."
      end
    }
    return "nobodys bday ): " if birthdaytoday == false
  end

end
