require 'birthday_list'

RSpec.describe Birthdays do

  it { is_expected.to be_kind_of(Birthdays) }
  context 'responds to these methods' do
    it { is_expected.to respond_to(:store).with(1) }
    it { is_expected.to respond_to(:view_all) }
    it { is_expected.to respond_to(:check_birthday) }
    it { is_expected.to respond_to(:age).with(1) }
  end

  it "adds a birthday to the birthday list" do
    birthday = double
    subject.store(birthday)
    expect(subject.list).to include(birthday)
  end

  
  it "shows returns the birthdays stored in the birthday list - #view_all not implemented yet" do
    mock_class = instance_double(Birthdays)
    allow(mock_class).to receive(:view_all).and_return("Name: John Adam | Birthday: 10 January 1795")
    expect(mock_class.view_all).to eq("Name: John Adam | Birthday: 10 January 1795")
  end

  it "shows all birthdays from the list in a nice format - #view_all implemented - mocked birthday class" do
    birthday1 = double(name: "John Adams", birthday: "10 January 1795")
    birthday2 = double(name: "May Day", birthday: "10 January 1795")
    subject.store(birthday1)
    subject.store(birthday2)
   
    expect { subject.view_all }.to output("Name: John Adams | Birthday: 10 January 1795\nName: May Day | Birthday: 10 January 1795\n").to_stdout
  end
  

  it "shows a matching birthday" do
    birthday1 = double(name: "John Adams", birthday: Time.new(1795, 3, 9))
    subject.store(birthday1)
    expect(subject.check_birthday.first).to eq  birthday1
  end

  it "shows matching birthdays" do
    birthday1 = double(name: "John Adams", birthday: Time.new(1795, 3, 9))
    birthday2 = double(name: "John Adams", birthday: Time.new(1900, 3, 9))
    subject.store(birthday1)
    subject.store(birthday2)
    expect(subject.check_birthday).to eq [birthday1, birthday2]
  end

  context "can calculate the age of the matched person " do
    it "calculates the age" do
      birthday = double(name: "John Adams", birthday: Time.new(2000, 3, 9))
      subject.store(birthday)
      expect(subject.age(birthday)).to eq 19
    end 
  end
end
