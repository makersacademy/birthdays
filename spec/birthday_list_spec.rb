require 'birthday_list'

describe BirthdayList do
  let(:birthday_list) { BirthdayList.new }

  it 'starts with an empty list of birthdays' do
    expect(birthday_list.birthdays).to eq([])
  end

  it 'stores a birthday in a list' do
    my_birthday = double('my fake birthday')
    birthday_list.store_birthday(my_birthday)
    expect(birthday_list.birthdays).to include(my_birthday)
  end

  it 'returns all birthdays each formatted on a line ' do
    my_birthday = double('my fake birthday')
    your_birthday = double('your fake birthday')
    allow(my_birthday).to receive(:name).and_return('Lilly')
    allow(my_birthday).to receive(:date).and_return('01/03/1989')
    allow(your_birthday).to receive(:name).and_return('Fred')
    allow(your_birthday).to receive(:date).and_return('23/05/1989')
    birthday_list.store_birthday(my_birthday)
    birthday_list.store_birthday(your_birthday)
    expect { birthday_list.see_birthdays }.to output.to_stdout
  end
end
