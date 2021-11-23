class BirthdayList
  attr_reader :birthdays

  def initialize
    @birthdays = []
  end

  def store_birthday(friend)
    @birthdays.push({ name: friend.name, birthday: friend.birthday })
  end

  def birthday_today?
    today = Time.new.strftime('%d/%m')
    current_year = Time.new.year
    message =
      @birthdays.select do |birthday|
        parts = birthday[:birthday].split('/')
        day_month = parts.select { |part| !(part.length > 2) }.join('/')
        birth_year = parts.select { |part| part.length == 4 }.join.to_i
        if today == day_month
          return(
            "It's #{birthday[:name]}'s birthday today! They are #{current_year - birth_year} years old!"
          )
        end
      end
    message.join
  end
end
