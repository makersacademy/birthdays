require "birthday_list"

describe BirthdayList do
  let(:birthday) {double :birthday}
  let(:birthday2) {double :birthday2}

  it "should be able to store a birthday" do
    expect(subject.add_birthday(birthday)).to match_array [birthday]
  end

  it "should be able to show stored birthday" do
    subject.add_birthday(birthday)
    expect(subject.show_birthdays).to match_array [birthday]
  end

  it "should be able to add multiple birthdays" do
    subject.add_birthday(birthday)
    subject.add_birthday(birthday2)
    expect(subject.show_birthdays).to match_array [birthday, birthday2]
  end

end
