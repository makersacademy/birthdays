require 'birthday_list'

describe BirthdayList do
  let(:birthday_list) { BirthdayList.new }
  let(:my_birthday) { double('my fake birthday') }

  it 'starts with an empty list of birthdays' do
    expect(birthday_list.birthdays).to eq([])
  end

  it 'stores a birthday in a list' do
    birthday_list.store_birthday(my_birthday)
    expect(birthday_list.birthdays).to include(my_birthday)
  end

  it 'returns each birthday formatted on a line ' do
    your_birthday = double('your fake birthday')
    allow(my_birthday).to receive_messages(name: 'Lilly', date: '01/03/1989')
    allow(your_birthday).to receive_messages(name: 'Fred', date: '23/05/1989')
    birthday_list.store_birthday(my_birthday)
    birthday_list.store_birthday(your_birthday)
    expect { birthday_list.see_birthdays }.to output("Lilly: 01/03/1989\nFred: 23/05/1989\n").to_stdout
  end

  it 'checks if a birthday is today and returns a message' do
    allow(my_birthday).to receive_messages(name: 'Lilly', date: Time.now.strftime('%d/%m/1989'), calculate_age: '32')
    birthday_list.store_birthday(my_birthday)
    expect { birthday_list.check_birthday }.to output("It's #{my_birthday.name}'s birthday today! They are #{my_birthday.calculate_age} years old!\n").to_stdout
  end
end
