require 'birthday_list'

describe Birthday do
  it 'can store birthdays' do
    expect(subject.store("Andrew", "1st January 1995")).to eq "Birthday stored!"
  end
end