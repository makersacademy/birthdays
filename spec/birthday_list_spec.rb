require 'birthday_list'

describe Person do
  it "correctly initalises with a name and a date of birth" do
    person1 = Person.new("Alex", Time.new(1991, 06, 04))
    expect(person1).to be_a_kind_of(Person)
  end

  it "returns date of birth" do
    person1 = Person.new("Alex", Time.new(1991, 06, 04))
    expect(person1.dob).to eq('4/6/1991')
  end

  it "returns name" do
    expect(Person.new("Alex", Time.new(1991, 06, 04)).name).to eq("Alex") 
  end
end
