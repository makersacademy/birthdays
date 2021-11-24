require "birthday_list"

describe BirthdayList do
  let(:birthday) {double :birthday}
  it "should be able to store a birthday" do
    expect(subject.add_birthday(birthday)).to eq birthday
  end

end
