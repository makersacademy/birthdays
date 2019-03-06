require "birthday_list"

describe "The add_birthday method" do
  it "gives a message when birthday added" do
    expect(add_birthday("Katie", "4th July")).to eq "Birthday added!"
  end

  # it "stores details when birthday is added" do
  #   # expect(add_birthday("Katie", "4th July")).to include("Katie")
  #   expect(add_birthday("Katie", "4th July")).to change(@birthdays, :count).by(1)
  # end
end

describe "The show_birthday method" do
  it "checks birthdays is a hash" do
    add_birthday("Katie", "4th July")
    expect(show_birthdays).to be_an_instance_of(Hash)
  end

  it "checks hash is not empty when birthday added" do
    add_birthday("Katie", "4th July")
    expect(show_birthdays).to include("Katie" => "4th July")
  end
end
