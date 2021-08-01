require 'birthday_list'

describe BirthdayList do
  it 'should return an attractive list of birthdays' do
    bd1, bd2 = double('Birthday'), double('Birthday')

    allow(bd1).to receive(:name) { 'Alice' }
    allow(bd1).to receive(:date) { Date.today }
    
    allow(bd2).to receive(:name) { 'Bob' }
    allow(bd2).to receive(:date) { Date.today.next_day }

    [bd1, bd2].each { |bd| subject.add bd }

    str = [
      "All Birthdays\n",
      "Alice - #{bd1.date.strftime("%B %d, %Y")}",
      "Bob - #{bd2.date.strftime("%B %d, %Y")}\n"
    ].join("\n")

    expect(subject.show_all).to eq(str)
  end

  it 'should be able to add birthdays' do
    bd = double('Birthday')

    allow(bd).to receive(:name) { 'Victoria' }
    allow(bd).to receive(:date) { Date.new(1982, 6, 3) }

    subject.add bd

    expect(subject.list).to eq([bd])
  end

  it "should show today's birthdays" do
    bd1, bd2 = double('Birthday'), double('Birthday')

    allow(bd1).to receive(:name) { 'Alice' }
    allow(bd1).to receive(:date) { Date.today }

    allow(bd2).to receive(:name) { 'Bob' }
    allow(bd2).to receive(:date) { Date.today.prev_year }

    [bd1, bd2].each { |bd| subject.add bd }

    str = "Today's Birthdays\n\nAlice is 0 today!\nBob is 1 today!\n"

    expect(subject.show_today).to eq(str)
  end
end
