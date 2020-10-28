require 'birthday_list'

describe Person do
  it "correctly initalises with a name and a date of birth" do
    person1 = Person.new("Dave", Time.new(1991, 06, 04))
    expect(person1).to be_a_type_of(Person)
  end
end
