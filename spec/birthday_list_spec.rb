require 'birthday_list'
require 'timecop'

describe BirthdayList do
  let(:birthday_list) { BirthdayList.new }
  let(:my_birthday) { double('my fake birthday') }

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

  it 'checks if a birthday is today and returns a message if so' do
    allow(my_birthday).to receive_messages(name: 'Lilly', date: Time.now.strftime('%d/%m/1989'), calculate_age: '32')
    birthday_list.store_birthday(my_birthday)
    expect { birthday_list.check_birthday }.to output("It's #{my_birthday.name}'s birthday today! They are #{my_birthday.calculate_age} years old!\n").to_stdout
  end

  it 'checks if a birthday is today and returns a message if so (timecop)' do
    fake_today = Timecop.freeze(Time.local(2021, 03, 01))
    allow(my_birthday).to receive_messages(name: 'Lilly', date: '01/03/1989', calculate_age: '32')
    birthday_list.store_birthday(my_birthday)
    expect { birthday_list.check_birthday }.to output("It's #{my_birthday.name}'s birthday today! They are #{my_birthday.calculate_age} years old!\n").to_stdout
  end

  it '#check_birthday returns nothing if birthday not today' do
    fake_today = Timecop.freeze(Time.local(2021, 11, 17))
    allow(my_birthday).to receive_messages(name: 'Lilly', date: '01/03/1989', calculate_age: '32')
    birthday_list.store_birthday(my_birthday)
    expect { birthday_list.check_birthday }.not_to output.to_stdout
  end

  
end
