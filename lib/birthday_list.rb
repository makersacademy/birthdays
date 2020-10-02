require_relative 'birthday'
 
class BirthdayList

    attr_accessor :list

    def initialize
        @list = []
    end

    def store_birthday(name, date)
        return "Your friend's birthday is already stored!" if self.name_exists?(name)
        self.add_person(name, date)
        return "#{name}'s birthday has been stored!"
    end

    def show_list
        list.each do |person|
            puts "#{person.name} || #{person.written_date}"
        end
        true
    end

    private

    def name_exists?(name)
        list.each do |person|
            return true if person.name == name 
        end

        false
    end

    def add_person(name, date)
        person = Birthday.new(name, date)
        list << person
    end
end
