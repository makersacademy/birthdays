require 'birthday_list'

describe BirthdayList do
  it 'can #store a birthday' do
    birthday_list = BirthdayList.new
    expect(birthday_list.birthdays).to eq []
  end
end
