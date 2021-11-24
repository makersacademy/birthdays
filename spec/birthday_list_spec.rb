require "birthday_list"

describe BirthdayList do
  let(:birthday) {double :birthday}
  let(:birthday2) {double :birthday2}

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

  it "should be able to show one name in a tidy format" do
    subject.add_birthday(Birthday.new("Kim", 13, 5, 1991))
    expect{ subject.show_birthdays }.to output("Kim's birthday is May 13, 1991").to_stdout
  end

  it "should store months in a textual format" do
    expect(BirthdayList::MONTHS).to match_array(["unknown", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"])
  end

  it "should be able to generate a textual month from a numerical value" do
    expect(subject.month_text(5)).to eq "May"
  end

end
