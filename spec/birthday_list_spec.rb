require 'birthday_list'
require 'person'
require 'directory'

describe Person do
  it "correctly initalises with a name and a date of birth" do
    person1 = Person.new("Alex", 1991, 06, 04)
    expect(person1).to be_a_kind_of(Person)
  end

  it "returns date of birth" do
    person1 = Person.new("Alex", 1991, 06, 04)
    expect(person1.dob).to eq('4/6/1991')
  end

  it "returns name" do
    expect(Person.new("Alex", 1991, 06, 04).name).to eq("Alex") 
  end
end

describe Directory do
  it "creates itself successfully without input" do
    expect(Directory.new).to be_a_kind_of(Directory)
  end

  it "creates itself with a list of people" do
    list_of_people = [Person.new("Dave", 1991, 06, 04), Person.new("Harriet", 1994, 07, 31)]
    expect(Directory.new(list_of_people)).to be_a_kind_of(Directory)
  end

  describe "#add_person" do
    it "adds a person to an empty list" do
      birthdays = Directory.new
      harriet = Person.new("Harriet", 1994, 07, 31)
      birthdays.add_person(harriet)
      expect(birthdays.people).to include(harriet)
    end
  end
end