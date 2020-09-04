require 'birthday_list'
require 'timecop'
describe "Birthdays" do

  describe "add" do
    it "returns a new birthday list" do
    birthdays = Birthdays.new
    expect(birthdays.add("Harry", "15/03/1802")).to eq [{name: "Harry", birthday: "15/03/1802"}]
    end

  end

  describe "show" do
    it "shows me a list of birthdays when there are 2 people" do
      birthdays = Birthdays.new
      birthdays.add("Harry", "15/03/1802")
      birthdays.add("Joe", "22/04/2002")

      expect(birthdays.show).to eq [{name: "Harry", birthday: "15/03/1802"}, {name: "Joe", birthday: "22/04/2002"}]
    end

    it "shows me a list of birthdays when there is one person" do
      birthdays = Birthdays.new
      birthdays.add("Harry", "15/03/1802")
      expect(birthdays.show).to eq [{name: "Harry", birthday: "15/03/1802"}]
    end
  end
  

  describe "check" do 
    it "returns 'Harrys birthday is today, he is 118 years old!'" do
      birthdays = Birthdays.new
      birthdays.add("Harry", "15/03/1802")
      birthdays.add("Joe", "22/04/2002")
      new_time = Time.local(1902, 03, 15, 12, 0, 0)
      Timecop.freeze(new_time)

      expect(birthdays.check).to eq "it is Harry's birthday today, they are 100 years old!"
    end
    it "returns nothing when its nobody's birthday" do
      birthdays = Birthdays.new
      birthdays.add("Harry", "15/03/1802")
      birthdays.add("Joe", "22/04/2002")
      new_time = Time.local(2002, 04, 15, 12, 0, 0)
      Timecop.freeze(new_time)

      expect { birthdays.check }.not_to output().to_stdout
    end
  end
end

