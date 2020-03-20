require 'birthday'

describe Birthday do
  it 'stores a date when you create it' do
    expect(Birthday).to respond_to(:new).with(1).argument 
  end

  it 'tells you its date' do
    birthday = Birthday.new("1st September")
    expect(birthday.date).to eq "1st September" 
  end

  it 'different birthdays print the correct dates' do
    first_birthday = Birthday.new("1st September")
    second_birthday = Birthday.new("5th August")
    expect(first_birthday.date).to eq "1st September"
    expect(second_birthday.date).to eq "5th August"
  end
end