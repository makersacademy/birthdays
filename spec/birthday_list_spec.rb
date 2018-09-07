require 'birthday_list.rb'

describe BirthdayList do
  it {is_expected.to respond_to(:add_birthday)}

  it "#add_birthday should store the birthday" do
    expect(subject.add_birthday("James", "10/10/10")).to eq([{ name: "James", date: "10/10/10"}])
  end

  it {is_expected.to respond_to(:print_list)}

  it "#print_list should print out the birthday list" do
    subject.add_birthday("James", "03/03/03")
    subject.add_birthday("Tom", "05/05/05")
    expect(subject.print_list).to eq("James: 03/03/03\nTom: 05/05/05\n")
  end

  it {is_expected.to respond_to(:birthday_search)}

  it "#birthday_search should search list for a particular date" do
    subject.add_birthday("James", "03/03/03")
    subject.add_birthday("Tom", "05/05/05")
    expect(subject.birthday_search("03/03/03")).to eq("It's James's birthday today!")
  end

  it "#birthday_search should return nothing if there is no birthday on search date" do
    subject.add_birthday("James", "03-03-03")
    subject.add_birthday("Tom", "05-05-05")
    expect(subject.birthday_search("03-04-03")).to be_nil
  end

end
