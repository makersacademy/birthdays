require 'birthday'

describe Birthday do
  it 'stores a date when you create it' do
    expect(Birthday).to respond_to(:new).with(1).argument 
  end

  it 'prints its date' do
    birthday = Birthday.new("1st September")
    expect { birthday.print_date }.to output("1st September").to_stdout
  end

  it 'different birthdays print the correct dates' do
    first_birthday = Birthday.new("1st September")
    second_birthday = Birthday.new("5th August")
    expect { first_birthday.print_date }.to output("1st September").to_stdout
    expect { second_birthday.print_date }.to output("5th August").to_stdout
  end
end