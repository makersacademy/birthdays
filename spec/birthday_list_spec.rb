require 'birthday_list'
require 'timecop'

describe BirthdayList do

  before :each do
    @birthday_list = BirthdayList.new
  end

  describe '#store' do
    it 'stores a birthday' do
      expect(@birthday_list.store('Jim', '01-01-1945')).to eq([{name: "Jim", date: Date.parse('01-01-1945') }])
    end
  end

  describe '#print' do
    it 'prints all stored birthdays' do
      @birthday_list.store('Veronica Lee', '01-01-1960')
      @birthday_list.store('Harry Potter', '31-07-1980')
      expect { @birthday_list.print }.to output("Veronica Lee (1 January 1960)\nHarry Potter (31 July 1980)\n").to_stdout
    end
  end

  describe "#check_todays" do
    it "gets a birthday that is today with the person's age" do
        allow(Date).to receive(:today).and_return(Date.strptime('31-07-1991', '%d-%m-%Y'))
        @birthday_list.store('Harry Potter', '31-07-1980')
        expect { @birthday_list.check_todays }.to output("It's Harry Potter's birthday today! They are 11 years old!\n").to_stdout
      # end
    end

    it "gets all birthdays that are today with the people's ages" do
      allow(Date).to receive(:today).and_return(Date.strptime('31-07-1991', '%d-%m-%Y'))
      @birthday_list.store('Harry Potter', '31-07-1980')
      @birthday_list.store('Veronica Lee', '03-11-1960')
      @birthday_list.store('Joe Bloggs', '31-07-1989')
      expect { @birthday_list.check_todays }.to output("It's Harry Potter's birthday today! They are 11 years old!\nIt's Joe Bloggs's birthday today! They are 2 years old!\n").to_stdout
    end
  end
end