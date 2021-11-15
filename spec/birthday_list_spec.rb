require 'birthday_list'

describe BirthdayList do
  let(:birthday_list) { BirthdayList.new }

  it 'starts with an empty list of birthdays' do
    expect(birthday_list.birthdays).to eq([])
  end

  it 'stores a birthday in a list' do
    birthday = double('fake birthday')
    birthday_list.store_birthday(birthday)
    expect(birthday_list.birthdays).to include(birthday)
  end
end
