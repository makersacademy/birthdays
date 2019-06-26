require 'birthday_list'


describe "the add birthday method" do
  it "returns a confirmation message" do
    expect(add_birthday("Paul","27.04.1993")).to eq "Name stored!"
  end
end

describe "check birthdays method" do
  it "check contents of birthday array" do
    expect(check_birthdays).to eq ([{"Paul"=>"27.04.1993"}])
  end
end
