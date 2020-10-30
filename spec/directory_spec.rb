require 'directory'

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

  describe "#birthdays_by_date" do
    it "lists birthdays on a given date and ignores others" do
      frankie = Person.new("Frank Sinatra", 1915, 12, 12)
      deano = Person.new("James Dean", 1931, 2, 8)
      birthdays = Directory.new([frankie, deano])
      expect(birthdays.list_by_date(1931, 2, 8)).to include(deano)
      expect(birthdays.list_by_date(1931, 2, 8)).not_to include(frankie)

    end
  end

  describe "#todays_birthdays" do
    it "returns people with a birthday of today, ignores others" do
      today = Date.today
      newborn = Person.new("Partario", today.year, today.month, today.day)
      # overengineered solution to create someone not born today
      # this prevents the 1/365 chance of this test getting weird
      # because both are born on the same day.
      other_day = today.day == 1 ? today.day + 1 : today.day - 1
      otherborn = Person.new("Basil Jet", today.year, today.month, other_day)

      birthdays = Directory.new([newborn, otherborn])
      expect(birthdays.todays_birthdays).to include(newborn)
      expect(birthdays.todays_birthdays).not_to include(otherborn)
    end
  end
end
