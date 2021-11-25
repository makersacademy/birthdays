require "birthday_list"
require "date"

describe BirthdayList do
  let(:birthday) {double :birthday, :name => "Kim", :day => 13, :month => 5, :year => 1991}
  let(:birthday2) {double :birthday2, :name => "Yoneya", :day => 1, :month => 1, :year => 1990}
  let(:birthday_girl) {double :birthday_girl, :name => "Bday Gal", :day => (Date.today.day), :month => (Date.today.month), :year => (Date.today.year - 25)}

  it "should be able to store a birthday" do
    expect(subject.add_birthday(birthday)).to match_array [birthday]
  end

  xit "should be able to show stored birthday" do
    subject.add_birthday(birthday)
    expect(subject.show_birthdays).to match_array [birthday]
  end

  it "should be able to add multiple birthdays" do
    subject.add_birthday(birthday)
    subject.add_birthday(birthday2)
    expect(subject.show_birthdays).to match_array [birthday, birthday2]
  end

  it "should store months in a textual format" do
    expect(BirthdayList::MONTHS).to match_array(["unknown", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"])
  end

  it "should be able to generate a textual month from a numerical value" do
    expect(subject.month_text(5)).to eq "May"
  end

  it "should be able to show one name in a tidy format" do
    subject.add_birthday(birthday)
    expect{ subject.show_birthdays }.to output("Kim's birthday is May 13, 1991\n").to_stdout
  end

  it "should be able to show multiple names in a tidy format" do
    subject.add_birthday(birthday)
    subject.add_birthday(birthday2)
    expect{ subject.show_birthdays }.to output("Kim's birthday is May 13, 1991\nYoneya's birthday is January 1, 1990\n").to_stdout
  end

  it "should be able to show whose birthday it is today" do
    allow(birthday_girl).to receive(:calculate_age).and_return(25)
    subject.add_birthday(birthday)
    subject.add_birthday(birthday2)
    subject.add_birthday(birthday_girl)
    expect{ subject.todays_birthday }.to output("It's Bday Gal's birthday today! They are 25 years old!\n").to_stdout
  end

end
