require 'birthday_list'

describe BirthdayList do
  it 'stores friends birthdays' do
    expect(subject).to respond_to(:store).with(2).argument
  end

  it 'confirms that a friends birthday has been stored' do
    expect(subject.store("Phil", Time.now)).to eq("Birthday stored!")
  end
end