require 'birthday_list'
require 'date'

describe BirthdayList do
  
  describe '#add_to_list' do
    it 'confirms when new name and birthday added' do
      name = "Harry Potter"
      dob = "1980/07/31"
      expect { subject.add_to_list(name, dob) }.to output(
        "#{name} has been added to the list!\n").to_stdout  
    end
  end

  describe '#print_list' do
    it 'prints all names and birthdays' do
      name = "Harry Potter"
      dob = "1980/07/31"
      subject.add_to_list(name, dob)
      expect { subject.print_list }.to output("#{name}: #{dob}\n").to_stdout
    end
  end

  describe '#have_bithday_on' do
    it 'checks whose birthday is today' do
      name = "Harry Potter"
      dob = "1980/07/31"
      today = Date.new(2019, 7, 31)
      subject.add_to_list(name, dob)
      age = subject.age_today(name, today)
      expect { subject.have_birthday_on(today) }.to output(
        "It's Harry Potter's birthday today! They are 39 years old!\n").to_stdout
    end
  end

  describe '#age_today' do
    it 'calculates people\'s age as of today' do
      name = "Harry Potter"
      dob = "1980/07/31"
      subject.add_to_list(name, dob)
      today = Date.new(2019, 7, 30)
      expect(subject.age_today(name,today)).to eq(38)
    end
  end

end
