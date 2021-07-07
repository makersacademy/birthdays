require "birthday_list"

describe Birthdays do
  before(:each) do
    @list = Birthdays.new
    @list.add_birthday("Katie", "04/07/1980")
  end

  it "gives a message when birthday added" do
    expect(@list.add_birthday("Katie", "04/07/1980")).to eq "Birthday added!"
  end

  it "stores details when birthday is added" do
    expect(@list.store_birthdays).to include("Katie" => "04/07/1980")
  end

  it "checks birthdays is a hash" do
    expect(@list.store_birthdays).to be_an_instance_of(Hash)
  end

  it "store_birthdays is not empty when birthday added" do
    expect(@list.store_birthdays).not_to be_empty
  end

  it "prints all birthdays on separate lines" do
    expect(@list.print_birthdays).to eq "Katie: 04/07/1980\n"
  end

  it "responds to birthday_today? method" do
    expect(@list).to respond_to(:birthday_today?)
  end
  
  it "prints whose birthday is today" do
    expect(@list.birthday_today?("04/07/2019")).to eq(
      "It's Katie's birthday today! They are 39 years old!"
    )
  end

  it "prints whose birthday is today for multiple matches" do
    @list.add_birthday("Matt", "04/07/1978")
    expect(@list.birthday_today?("04/07/2019")).to eq(
      "It's Katie's birthday today! They are 39 years old!\nIt's Matt's birthday today! They are 41 years old!"
    )
  end

end
