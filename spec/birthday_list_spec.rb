require 'birthday_list'
require 'date'

describe BirthdayList do
  it 'should return a list of birthdays' do
    expect(subject.all).to be_instance_of(Hash)
  end

  it 'should be able to add birthdays' do
    new_birthday = double('Birthday')

    allow(new_birthday).to receive(:name) { 'Victoria' }
    allow(new_birthday).to receive(:date) { Date.new(1982, 6, 3) }

    subject.add new_birthday

    expect(subject.all).to eq({ new_birthday.date => [new_birthday.name] })
  end
end
