require 'birthday_list'
require 'birthday'

RSpec.describe Birthdays do

  it { is_expected.to be_kind_of(Birthdays) }
  context 'responds to these methods' do
    it { is_expected.to respond_to(:store).with(1) }
    it { is_expected.to respond_to(:view_all) }
    it { is_expected.to respond_to(:check_birthday) }
    it { is_expected.to respond_to(:age).with(1) }
  end

  it "adds a birthday to the birthday list" do
    birthday = instance_double(Birthday)
    subject.store(birthday)
    expect(subject.list).to include(birthday)
  end
  
  it "shows returns the birthdays stored in the birthday list - #view_all not implemented yet" do
    mock_birthday_list = instance_double(Birthdays)
    allow(mock_birthday_list).to receive(:view_all).and_return("Name: John Adam | Birthday: 10 January 1795")
    expect(mock_birthday_list.view_all).to eq("Name: John Adam | Birthday: 10 January 1795")
  end

  it "shows all birthdays from the list in a nice format - #view_all implemented - mocked birthday class" do
    birthday1 = double(name: "John Adams", birthday: Time.new(1795, 1, 10))
    birthday2 = double(name: "May Day", birthday: Time.new(1795, 1, 10))
    subject.store(birthday1)
    subject.store(birthday2)
   
    expect { subject.view_all }.to output("Name: John Adams | Birthday: 10 January 1795\nName: May Day | Birthday: 10 January 1795\n").to_stdout
  end

  it "shows a matching birthday" do
    m = Time.now.month
    d = Time.now.day
    birthday1 = double(name: "John Adams", birthday: Time.new(2001, m, d))
    subject.store(birthday1)
    expect { subject.check_birthday.first }.to output("It's #{birthday1.name}'s birthday today! They are #{subject.age(birthday1)} years old!\n").to_stdout
  end

  it "shows matching birthdays" do
    m = Time.now.month
    d = Time.now.day
    birthday1 = double(name: "John Adams", birthday: Time.new(2000, m, d))
    birthday2 = double(name: "John Adams", birthday: Time.new(2001, m, d))
    subject.store(birthday1)
    subject.store(birthday2)
    expect { subject.check_birthday }.to output("It's #{birthday1.name}'s birthday today! They are #{subject.age(birthday1)} years old!\n" +
    "It's #{birthday2.name}'s birthday today! They are #{subject.age(birthday2)} years old!\n").to_stdout
  end

  context "can calculate the age of the matched person " do
    it "calculates the age" do
      m = Time.now.month
      d = Time.now.day
      birthday = double(name: "John Adams", birthday: Time.new(2000, m, d))
      subject.store(birthday)
      expect(subject.age(birthday)).to eq 19
    end 
  end

  context "tests method with real birthday class" do

    it "adds birthday to the list" do
      birthday = Birthday.new("John", "Adams", "17 January 2000")
      subject.store(birthday)
      expect(subject.list).to include(birthday)
    end

    it "shows all birthdays" do
      date1 = Time.new(1795,1,10).strftime("%d %B %Y")
      date2 = Time.new(2000,1,17).strftime("%d %B %Y")
      birthday1 = Birthday.new("John", "Adams", date1)
      birthday2 = Birthday.new("May", "Day", date2)
      subject.store(birthday1)
      subject.store(birthday2)

      expect { subject.view_all }.to output("Name: John Adams | Birthday: 10 January 1795\nName: May Day | Birthday: 17 January 2000\n").to_stdout
    end

    it "shows two matching birthdays" do
      date1 = Time.new(1795,3,10).strftime("%d %B %Y")
      date2 = Time.new(2000,3,10).strftime("%d %B %Y")
      date3 = Time.new(1985,1,1).strftime("%d %B %Y")
      birthday1 = Birthday.new("John", "Adams", date1)
      birthday2 = Birthday.new("May", "Day", date2)
      birthday3 = Birthday.new("May", "Day", date3)
      subject.store(birthday1)
      subject.store(birthday2)
      subject.store(birthday3)

      expect { subject.check_birthday } .to output("It's #{birthday1.name}'s birthday today! They are #{subject.age(birthday1)} years old!\n" +
      "It's #{birthday2.name}'s birthday today! They are #{subject.age(birthday2)} years old!\n").to_stdout
    end

    it "can calculate age of matched person" do
      date = Time.new(1795,3,10).strftime("%d %B %Y")
      birthday1 = Birthday.new("John", "Adams", date)
      subject.store(birthday1)
      expect(subject.age(birthday1)).to eq 224
    end

    it "shows nothing if no match" do
      birthday1 = Birthday.new("John", "Adams", "11 March 1795")
      subject.store(birthday1)

      expect(subject.check_birthday).to be_empty
    end
  end
end
