require 'birthday_list'
require 'date'

describe BirthdayTracker do
  current_date = Date.today
  date_tomorrow = Date.today + (60 * 60 * 24)
  def age(dob)
    current_year = Date.today.year
    birth_year = Date.parse(dob).year
    current_year - birth_year
  end

  let(:always_bday) { double(:foo, name: 'Chris', dob: "1985-#{current_date.month}-#{current_date.day}") }
  let(:never_bday) { double(:foo, name: 'Daisy', dob: "1995-#{date_tomorrow.month}-#{date_tomorrow.day}") }

  describe '#store' do
    it 'responds' do
      expect(subject).to respond_to :store
    end
    it 'accepts two arguments' do
      expect(subject).to respond_to(:store).with(2).arguments
    end
  end

  describe "@storage" do
    it "responds" do
      expect(subject).to respond_to :storage
    end
  end

  describe '#all' do
    it 'responds' do
      expect(subject).to respond_to :all
    end
    it 'prints a list of a stored friend and birthday' do
      subject.store(always_bday.name, always_bday.dob)
      expect { subject.all }.to output("#{always_bday.name}: #{always_bday.dob}\n").to_stdout
    end
    it 'prints two stored friends and birthdays' do
      subject.store(always_bday.name, always_bday.dob)
      subject.store(never_bday.name, never_bday.dob)
      expect { subject.all }.to output("#{always_bday.name}: #{always_bday.dob}\n#{never_bday.name}: #{never_bday.dob}\n").to_stdout
    end
  end

  describe '#today' do
    it "responds" do
      expect(subject).to respond_to :today
    end
    it "prints a list of friends if their birthday is today" do
      subject.store(always_bday.name, always_bday.dob)
      subject.store(never_bday.name, never_bday.dob)
      expect { subject.today }.to output("It's #{always_bday.name}'s birthday today! They are #{age(always_bday.dob)} years old!\n").to_stdout
    end
  end

end
