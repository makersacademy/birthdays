require 'birthday_list'

RSpec.describe Birthday do
  describe "#save_birthday" do
    it "should store a user entered birthday" do
      subject.save_birthday("Bob", "01/04/1980")
      expect(subject.store.length).to eq(1)
    end
  end

  describe "#print_list" do
    it "prints all entries" do
      subject.save_birthday("Bob", "01/04/1980")
      # subject.save_birthday("Ahmed", "22/06/1985")
      expect(subject.print_list).to eq("Name: Bob, Date: 01/04/1980")
    end
  end
end
