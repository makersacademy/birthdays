require 'birthday_list'

describe BirthdayList do
  it 'stores friends birthdays' do
    expect(subject).to respond_to(:store).with(2).argument
  end

  it 'confirms that a friends birthday has been stored' do
    birthday = Birthday.new("1st January")
    expect(subject.store("Phil", birthday)).to eq("Birthday stored!")
  end

  it 'prints all of the stored friends and their birthdays, each on a single line with a tidy format when a single friend is stored' do
    birthday = Birthday.new("1st January")
    subject.store("Phil", birthday)
    expect { subject.print_stored_friends }.to output("Phil#{BirthdayList::COLUMN_SPACER}1st January\n").to_stdout
  end

  it 'prints all stored friends and their birthdays, each on a single line with a tidy format when multiple friends are stored' do
    subject.store("Phil", Birthday.new("1st January"))
    subject.store("Steve", Birthday.new("15th August"))
    expect { subject.print_stored_friends }.to output("Phil#{BirthdayList::COLUMN_SPACER}1st January\nSteve#{BirthdayList::COLUMN_SPACER}15th August\n").to_stdout
  end
end