require 'birthday_list'

describe 'store_birthday method' do
  it 'returns a success message when passed a name and birthday' do
    expect(store_birthday('Jim', 01-01-1945)).to eq 'Birthday stored!'
  end
end

