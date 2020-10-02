require "Date"

class Birthday

    attr_reader :written_date, :name

    def initialize(name, date)
        @name = name
        @birthdate = date
        @written_date = self.write_date(date)
    end

    private

    def write_date(date)
        read_date = Date.strptime(date, "%d/%m/%Y")
        converted_date = read_date.strftime("%B %d, %Y")
    end
end