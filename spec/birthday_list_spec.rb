require 'birthday_list'

describe BirthdayList do

  describe 'store' do
    it 'stores a birthday' do
      birthday_list = BirthdayList.new
      expect(birthday_list.store('Jim', '01-01-1945')).to eq([{name: "Jim", date: "1 January 1945"}])
    end
  end

  describe 'print_all' do
    it 'prints a single birthday when only one stored' do
      birthday_list = BirthdayList.new
      birthday_list.store('Veronica Lee', '01-01-1980')
      expect { birthday_list.print_all }.to output("Veronica Lee (1 January 1980)\n").to_stdout
    end

    it 'prints all stored birthdays when multiple stored' do
      birthday_list = BirthdayList.new

      birthday_list.store('Veronica Lee', '01-01-1960')
      birthday_list.store('Harry Potter', '31-07-1980')
      expect { birthday_list.print_all }.to output("Veronica Lee (1 January 1960)\nHarry Potter (31 July 1980)\n").to_stdout
    end
  end

  describe 'print_todays' do
    def setup
      travel_to Chronic.parse("31-07-1991")
    end

    it "prints a birthday that is today with the person's age" do
      birthday_list = BirthdayList.new
      birthday_list.store('Harry Potter', '31-07-1980')
      expect { birthday_list.print_todays }.to output("It's Harry Potter's birthday today! They are 11 years old!\n").to_stdout
    end

    def teardown
      travel_back
    end
  end
end