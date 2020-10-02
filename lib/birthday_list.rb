require_relative 'birthday'
 
class BirthdayList

    def initialize
        @list = {}
    end

    def store_birthday(name, date)
        if @list[name].nil?
            @list[name] = Birthday.new(date)
        else
            return "Your friend's birthday is already stored!"
        end
        return "#{name}'s birthday has been stored!"
    end
end
