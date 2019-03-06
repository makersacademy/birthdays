require "birthday_list"

describe "The add_birthday method" do
  it "gives a message when birthday added" do
    birthdays_list
    expect(add_birthday("Katie", "4th July")).to eq "Birthday added!"
  end

  it "stores details when birthday is added" do
    birthdays_list
    add_birthday("Katie", "4th July")
    expect(store_birthdays).to include("Katie" => "4th July")
  end
end

describe "The store_birthday method" do
  it "checks birthdays is a hash" do
    birthdays_list
    add_birthday("Katie", "4th July")
    expect(store_birthdays).to be_an_instance_of(Hash)
  end

  it "store_birthdays is not empty when birthday added" do
    birthdays_list
    add_birthday("Katie", "4th July")
    expect(store_birthdays).not_to be_empty
  end

  it "prints all birthdays on separate lines" do
    birthdays_list
    add_birthday("Matt", "31st January")
    expect(print_birthdays).to eq "Matt: 31st January\n"
  end
end
