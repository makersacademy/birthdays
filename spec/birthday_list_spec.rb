require 'birthday_list'

describe Birthday do
  it 'can store birthdays' do
    expect(subject.store("Andrew", "1st January 1990")).to eq ({name: "Andrew", birthday: "1st January 1990"})
  end

  it 'can store another birthday' do
    expect(subject.store("Ben", "2nd January 1991")).to eq ({name: "Ben", birthday: "2nd January 1991"})
  end

  it 'can show the list of birthdays' do
    subject.store("Andrew", "1st January 1990")
    subject.store("Ben", "2nd January 1991")
    expect { subject.show } .to output("Andrew's birthday is on 1st January 1990\nBen's birthday is on 2nd January 1991\n").to_stdout
  end

  it 'can see whose birthday it is today and give their age' do
    # check through the bdays I have stored and check each one to see if its their birthday.
    subject.store("Andrew", "1st January 1990")
    # set the date to 1st January 2021
    allow(Date).to receive(:today).and_return Date.new(2021,1,1)
    expect { subject.today } .to output("It's Andrew's birthday today! They are 31 years old!\n").to_stdout
  end

  it 'returns nothing when there are no birthdays today' do
    subject.store("Andrew", "1st January 1990")
    expect { subject.today } .not_to output().to_stdout
  end


end