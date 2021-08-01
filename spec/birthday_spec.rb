require 'birthday_list'
require 'birthday'

describe Birthday do
  it 'should have a name' do
    new_birthday = Birthday.new('Jazelle')

    expect(new_birthday.name).to eq('Jazelle')
  end
end
