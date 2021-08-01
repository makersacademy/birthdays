require 'birthday_list'

describe BirthdayList do
  it 'should return an attractive list of birthdays' do
    birthday1 = double('Birthday')
    birthday2 = double('Birthday')

    allow(birthday1).to receive(:name) { 'Alice' }
    allow(birthday1).to receive(:date) { Date.today }
    
    allow(birthday2).to receive(:name) { 'Bob' }
    allow(birthday2).to receive(:date) { Date.today.next_day }

    subject.add birthday1
    subject.add birthday2

    str = [
      "All Birthdays\n",
      "Alice - #{birthday1.date.strftime("%B %d, %Y")}",
      "Bob - #{birthday2.date.strftime("%B %d, %Y")}"
    ].join("\n")

    expect(subject.list).to eq(str)
  end

  it 'should be able to add birthdays' do
    birthday = double('Birthday')

    allow(birthday).to receive(:name) { 'Victoria' }
    allow(birthday).to receive(:date) { Date.new(1982, 6, 3) }

    subject.add birthday

    expect(subject.list)
    .to eq("All Birthdays\n\nVictoria - June 03, 1982")
  end

  it "should show today's birthdays" do
    birthday1 = double('Birthday')
    birthday2 = double('Birthday')

    allow(birthday1).to receive(:name) { 'Alice' }
    allow(birthday1).to receive(:date) { Date.today }

    allow(birthday2).to receive(:name) { 'Bob' }
    allow(birthday2).to receive(:date) { Date.today.prev_year }

    subject.add birthday1
    subject.add birthday2

    str = "Today's Birthdays:\nAlice is 0 today!\nBob is 1 today!"
    expect(subject.today).to eq(str)
  end
end
