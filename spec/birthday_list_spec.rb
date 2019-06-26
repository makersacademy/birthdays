require 'birthday_list'


describe "the add birthday method" do
  it "returns a confirmation message" do
    expect(add_birthday("Paul","27 04 1993")).to eq "Name stored!"
  end
  it "returns a confirmation message" do
    expect(add_birthday("Zi","12 06 1991")).to eq "Name stored!"
  end
  it "returns a confirmation message" do
    expect(add_birthday("Test","12 08 1991")).to eq "Name stored!"
  end
  it "returns a confirmation message" do
    expect(add_birthday("Fake","26 06 1991")).to eq "Name stored!"
  end
end

describe "check birthdays method" do

  it "check contents of birthday array" do
    $birthdays = {}
    expect(check_birthdays).not_to include ({"Paul"=>"27 04 1993"})
  end
end

describe "how old method" do
  it "works out how old someone is" do
    add_birthday("Paul","27 04 1993")
    expect(how_old("Paul")).to eq 26
  end

end

describe "how old method" do
  it "works out how old someone is" do
    add_birthday("Zi","12 06 1991")
    expect(how_old("Zi")).to eq 28
  end
end

describe "whose birthday method" do
  it "tells me whose birthday is today" do
    add_birthday("Fake","26 06 1991")
    expect(whose_birthday).to eq "Fake is 28 years old today."
  end
  it "tells me if it's noone's bday" do
    add_birthday("Fake","24 06 1991")
    expect(whose_birthday).to eq "nobody's bday ): "
  end
end
