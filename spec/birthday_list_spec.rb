require 'birthday_list'

describe BirthdayList do
  it 'stores friends birthdays' do
    expect(subject).to respond_to(:store).with(2).argument
  end
end