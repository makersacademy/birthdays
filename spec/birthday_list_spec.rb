require 'birthday_list'

describe BirthdayList do
  let(:first_birthday) { double(:birthday, :date => "1st January") }
  let(:second_birthday) { double(:birthday, :date => "15th August") }

  it 'stores friends birthdays' do
    expect(subject).to respond_to(:store).with(2).argument
  end

  it 'confirms that a friends birthday has been stored' do
    expect(subject.store("Phil", first_birthday)).to eq("Birthday stored!")
  end

  it 'prints all of the stored friends and their birthdays, each on a single line with a tidy format when a single friend is stored' do
    subject.store("Phil", first_birthday)
    expect { subject.print_stored_friends }.to output("Phil#{BirthdayList::COLUMN_SPACER}1st January\n").to_stdout
  end

  it 'prints all stored friends and their birthdays, each on a single line with a tidy format when multiple friends are stored' do
    subject.store("Phil", first_birthday)
    subject.store("Steve", second_birthday)
    expect { subject.print_stored_friends }.to output("Phil#{BirthdayList::COLUMN_SPACER}1st January\nSteve#{BirthdayList::COLUMN_SPACER}15th August\n").to_stdout
  end
end