require 'birthday_list'

describe BirthdayList do
  it 'stores a birthday' do
    list = BirthdayList.new
    birthday = "today"
    expect { list.add(birthday) }.to change { list.birthdays }
  end

  it 'prints a list of birthdays' do
    list = BirthdayList.new
    birthday = "today"
    list.add(birthday)
    expect{ list.print_all_birthdays }.to output("today\n").to_stdout
  end
end