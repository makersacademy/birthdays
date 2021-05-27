require 'birthday_list'

describe Birthday do
  it 'can store birthdays' do
    expect(subject.store("Andrew", "1st January")).to eq "Birthday stored!"
  end

  it 'can store another birthday' do
    expect(subject.store("Ben", "2nd January")).to eq "Birthday stored!"
  end

  it 'can show the list of birthdays' do
    expect { subject.show } .to output("Andrew's birthday is on 1st January\nBen's birthday is on 2nd January\n").to_stdout
  end

end