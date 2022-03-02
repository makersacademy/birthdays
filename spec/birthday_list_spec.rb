require 'birthday_list'
require 'date'

describe BirthdayList do
  subject(:list) { described_class.new }
  let(:today) { Date.today }
  let(:birthday) { double(
      :birthday,
      :name => "Mary Poppins",
      :birthdate => Date.new(1899,8,9)
    )
  }  

  it 'stores a birthday' do
    expect { list.add(birthday) }.to change { list.size }
  end

  it 'prints a list of birthdays' do
    list.add(birthday)
    expect { list.print_all_birthdays }.to output("Mary Poppins - 09/08\n").to_stdout
  end

  it 'produces a birthday reminder' do
    2.times { list.add(birthday) }
    allow(birthday).to receive(:name).and_return("Mr Today")
    allow(birthday).to receive(:birthday_today?).and_return(false, true)
    allow(birthday).to receive(:age).and_return(22)
    expect { list.birthday_check(today) }.to output("It is Mr Today's birthday today! They are 22 years old!\n").to_stdout
  end
end
