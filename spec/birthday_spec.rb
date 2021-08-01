require 'birthday_list'
require 'birthday'

describe Birthday do
  it 'should have a name' do
    birthday = Birthday.new('Jazelle', Date.today)

    expect(birthday.name).to eq('Jazelle')
  end

  it 'should have a date' do
    dob = Date.new(1970, 2, 6)
    birthday = Birthday.new('Adrian', dob)

    expect(birthday.date).to eq(dob)
  end
end
