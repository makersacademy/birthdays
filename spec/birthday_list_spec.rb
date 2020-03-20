require 'birthday_list'

describe BirthdayList do
  let(:first_birthday) {double(:birthday, :date => Time.new(1977, 1, 1), :to_s => "1 1 1977")}
  let(:second_birthday) {double(:birthday, :date => Time.new(1958, 8, 15), :to_s => "15 8 1958")}

  it 'stores friends birthdays' do
    expect(subject).to respond_to(:store).with(2).argument
  end

  it 'confirms that a friends birthday has been stored' do
    expect(subject.store("Phil", first_birthday)).to eq("Birthday stored!")
  end

  it 'prints all of the stored friends and their birthdays, each on a single line with a tidy format when a single friend is stored' do
    subject.store("Phil", first_birthday)
    expect { subject.print_stored_friends }.to output("Phil#{BirthdayList::COLUMN_SPACER}1 1 1977\n").to_stdout
  end

  it 'prints all stored friends and their birthdays, each on a single line with a tidy format when multiple friends are stored' do
    subject.store("Phil", first_birthday)
    subject.store("Steve", second_birthday)
    expect { subject.print_stored_friends }.to output("Phil#{BirthdayList::COLUMN_SPACER}1 1 1977\nSteve#{BirthdayList::COLUMN_SPACER}15 8 1958\n").to_stdout
  end

  it 'when you ask it to print todays birthdays and there are none, it prints nothing' do
    subject.store("Phil", first_birthday)
    expect { subject.print_todays_birthdays }.to output("").to_stdout
  end

  it 'when you ask it to print todays birthdays and there are some, it prints them' do
    current_month = Time.now.month
    current_date = Time.now.day

    birthday_today_1 = double(:birthday, :date => Time.new(1956, current_month, current_date), :to_s => "#{current_date} #{current_month} #{1956}")
    birthday_today_2 = double(:birthday, :date => Time.new(1984, current_month, current_date), :to_s => "#{current_date} #{current_month} #{1984}")
    
    subject.store("Phil", birthday_today_1)
    subject.store("Emma", first_birthday)
    subject.store("Steve", birthday_today_2)

    expected_output = "It's Phil's birthday today! They are #{Time.now.year - 1956} years old!\n"
    expected_output << "It's Steve's birthday today! They are #{Time.now.year - 1984} years old!\n"
    expect { subject.print_todays_birthdays }.to output(expected_output).to_stdout
  end
end