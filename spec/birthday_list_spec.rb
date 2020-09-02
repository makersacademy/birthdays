require 'birthday_list'

describe 'store_birthday method' do
  it 'returns a success message when passed a name and birthday' do
    expect(store_birthday('Jim', 01-01-1945)).to eq 'Birthday stored!'
  end
end

describe 'print_birthdays method' do
  it 'prints a list of stored friends and their birthdays' do
    name = 'Jim'
    birthday = 01-01-1945
    store_birthday(name, birthday)
    expect(get_birthdays).to eq "#{name} #{birthday}"
  end
end