require 'birthday_list'
require 'date'

describe BirthdayList do
  subject(:list) { described_class.new }
  let(:today) { Date.today }
  let(:birthday) { double(
      :birthday_double,
      :name => "Mary Poppins",
      :birthdate => Date.new(1899,8,9),
      :birthday_today? => false
    )
  }  
  let(:birthday_today) { double(
    :birthday_double,
    :name => "Bert Day", 
    :birthday_today? => true,
    :age => 22
    )
  }
  describe '#add' do
    it 'adds a birthday' do
      expect { list.add(birthday) }.to change { list.size }.by(1)
    end
  end
  
  describe '#print_all_birthdays' do
    it 'prints a list of birthdays' do
      list.add(birthday)
      expect { list.print_all_birthdays }.to output("Mary Poppins - 09/08\n").to_stdout
    end
  end

  describe '#birthday_check' do
    it 'prints a birthday reminder' do
      list.add(birthday)
      list.add(birthday_today)
      expect { list.birthday_check(today) }.to output("It is Bert Day's birthday today! They are 22 years old!\n").to_stdout
    end
  end
end
