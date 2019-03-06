require "birthday_list"

describe "The add_birthday method" do
  it "gives a message when birthday added" do
    birthdays_list
    expect(add_birthday("Katie", "4th July")).to eq "Birthday added!"
  end

  it "stores details when birthday is added" do
    birthdays_list
    add_birthday("Katie", "4th July")
    expect(show_birthdays).to include("Katie" => "4th July")
  end
end

describe "The show_birthday method" do
  it "checks birthdays is a hash" do
    birthdays_list
    add_birthday("Katie", "4th July")
    expect(show_birthdays).to be_an_instance_of(Hash)
  end

  it "show_birthdays is not empty when birthday added" do
    birthdays_list
    add_birthday("Katie", "4th July")
    expect(show_birthdays).not_to be_empty
  end
end
