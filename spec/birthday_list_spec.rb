require 'birthday_list'
require 'date'


date = Date.today.to_s.split('-').reverse.map(&:to_i).join(" ")
p date


describe Birthday do
  it "returns a confirmation message" do
    expect(subject.add_birthday("Paul","27 04 1993")).to eq "Name stored!"
  end
end

describe Birthday do
  it "checks contents of birthday hash" do
    expect(subject.check_birthdays).not_to include ({"Paul"=>"27 04 1993"})
  end
  it "checks if you can add a birthday and retrieve it" do
    subject.add_birthday("Paul","27 04 1993")
    expect(subject.check_birthdays).to include ({"Paul"=>"27 04 1993"})
  end
end

describe Birthday do
  it "works out how old someone is if birthday gone" do
    subject.add_birthday("Paul","27 04 1993")
    expect(subject.how_old("Paul")).to eq 26
  end

end

describe Birthday do
  it "tells me whose birthday is today" do
    subject.add_birthday("Fake", "27 06 1991")
    expect(subject.whose_birthday).to eq "Fake is 28 years old today."
  end
  it "tells me if it's noone's bday" do
    subject.add_birthday("Fake","24 06 1991")
    expect(subject.whose_birthday).to eq "nobody's bday ): "
  end
end
