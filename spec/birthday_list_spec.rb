require 'birthday_list'
describe BirthdayList do
  it {is_expected.to respond_to(:add_birthday)}

  it "#add_birthday should store the birthday" do
    expect(subject.add_birthday("James")).to eq(["James"])
  end

  it {is_expected.to respond_to(:print_list)}

  it "#print_list should print out the birthday list" do
    subject.add_birthday("James")
    subject.add_birthday("Tom")
    expect(subject.print_list).to eq("James\nTom\n")
  end
end
