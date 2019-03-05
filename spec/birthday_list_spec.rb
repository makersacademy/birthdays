require "birthday_list"

describe "The add_birthday method" do
  it "gives a message when birthday added" do
    expect(add_birthday("Katie", "4th July")).to eq "Birthday added!"
  end
end

describe "The show_birthday method" do
  it "checks birthdays is a hash" do
    expect(show_birthdays({"Katie" => "4th July"})).to be_an_instance_of(Hash)
  end

  it "checks hash is not empty when name added" do
    expect(show_birthdays({"Katie" => "4th July"})).to eq({"Katie" => "4th July"})
  end
end
