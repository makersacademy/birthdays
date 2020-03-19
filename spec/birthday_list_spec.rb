require 'birthday_list'

describe BirthdayList do
  it 'stores friends birthdays' do
    expect(subject).to respond_to(:store).with(2).argument
  end

  it 'confirms that a friends birthday has been stored' do
    expect(subject.store("Phil", "1st January")).to eq("Birthday stored!")
  end

  it 'prints all of the stored friends and their birthdays, each on a single line with a tidy format when a single friend is stored' do
    subject.store("Phil,", "1st January")
    expect { subject.print }.to output("Phil\t\t\t1st January\n").to_stdout
  end
end