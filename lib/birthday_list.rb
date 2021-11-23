
class BirthdayList
	attr_reader :birthdays

	def initialize
		@birthdays = []
	end

	def store_birthday(friend)
		@birthdays.push({ name: friend.name, birthday: friend.birthday })
	end

end
