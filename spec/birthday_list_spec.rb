require 'birthday_list'
require 'date'

describe BirthdayList do
  it 'should return a list of birthdays' do
    expect(subject.list).to be_instance_of(Hash)
  end

  it 'should be able to add birthdays' do
    new_birthday = double('Birthday')

    allow(new_birthday).to receive(:name) { 'Victoria' }
    allow(new_birthday).to receive(:date) { Date.new(1982, 6, 3) }

    subject.add new_birthday

    expect(subject.list).to eq({ new_birthday.date => [new_birthday.name] })
  end

  it "should show today's birthdays" do
    new_birthday1 = double('Birthday')
    new_birthday2 = double('Birthday')

    allow(new_birthday1).to receive(:name) { 'Birthday Girl' }
    allow(new_birthday1).to receive(:date) { Date.today }

    allow(new_birthday2).to receive(:name) { 'Birthday Boy' }
    allow(new_birthday2).to receive(:date) { Date.today.prev_year }

    subject.add new_birthday1
    subject.add new_birthday2

    expect(subject.today)
    .to eq(
      "Today's Birthdays:\nBirthday Girl is 0 today!\nBirthday Boy is 1 today!"
    )
  end
end
