require 'birthday'

describe Birthday do
  it 'stores a date when you create it' do
    expect(Birthday).to respond_to(:new).with(1).argument 
  end

  it 'tells you its date' do
    birthday = Birthday.new(1, 9, 1977)
    expect(birthday.date).to eq Time.new(1977, 9, 1) 
  end

  it 'different birthdays print the correct dates' do
    first_birthday = Birthday.new(1, 9, 1977)
    second_birthday = Birthday.new(5, 8, 1985)
    expect(first_birthday.date).to eq Time.new(1977, 9, 1) 
    expect(second_birthday.date).to eq Time.new(1985, 8, 5) 
  end
end