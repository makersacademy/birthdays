require 'birthday_list'

RSpec.describe Birthday do
  describe "#save_birthday" do
    it "should store a user entered birthday" do
      subject.save_birthday("Bob", "01/04/1980")
      expect(subject.store.length).to eq(1)
    end
  end

  describe "#print_list" do
    it "prints an entry" do
      subject.save_birthday("Bob", "01/04/1980")
      expect(subject.print_list).to eq("Name: Bob, Date: 01/04/1980")
    end
  end

  describe "#print_list" do
    it "prints multiple entries" do
      subject.save_birthday("Bob", "01/04/1980")
      subject.save_birthday("Ahmed", "22/06/1985")
      expect(subject.print_list).to eq("Name: Bob, Date: 01/04/1980\nName: Ahmed, Date: 22/06/1985")
    end
  end

  describe "#check_list" do
    it "should compare all entries with todays date and output if there is a match" do
      subject.save_birthday("Mary Poppins", "03/05/1897")
      expect(subject.check).to eq("It's Mary Poppins's birthday today! They are 124 years old!")
    end
  end
end
