require 'birthday_list'

describe 'store_birthday method' do
  it 'returns a success message when passed a name and birthday' do
    expect(store_birthday('Jim', 01-01-1945)).to eq 'Birthday stored!'
  end
end

describe 'print_birthdays method' do
  it 'prints a birthday in a tidy format, when only one saved' do
    store_birthday('Veronica Lee', 01-01-1960)
    expect { print_birthdays }.to output("Veronica Lee (1 January 1960)\n").to_stdout
  end
end