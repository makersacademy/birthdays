require 'birthday_list'
require 'birthday'
require 'birthday_list_spec_module'

RSpec.describe Birthdays do
  include BirthdayHelperMethodsModule

  let(:birthday_adams) { Birthday.new("John", "Adams", "17 January 2000")}
  
  it { is_expected.to be_kind_of(Birthdays) }
  context 'responds to these methods' do
    it { is_expected.to respond_to(:store).with(1) }
    it { is_expected.to respond_to(:view_all) }
    it { is_expected.to respond_to(:check_birthday) }
  end

  it "adds a birthday to the birthday list" do
    add_one_double
    expect(subject.list.size).to eq 1
  end
  
  it "shows returns the birthdays stored in the birthday list - #view_all not implemented yet" do
    mock_birthday_list = instance_double(Birthdays)
    allow(mock_birthday_list).to receive(:view_all).and_return("Name: John Adam | Birthday: 10 January 1795")
    expect(mock_birthday_list.view_all).to eq("Name: John Adam | Birthday: 10 January 1795")
  end

  it "shows all birthdays from the list in a nice format - #view_all implemented - mocked birthday class" do
    create_and_add_two_birthdays
    expect { subject.view_all }.to output("Name: John Adams | Birthday: 10 January 1795\nName: May Day | Birthday: 10 January 1795\n").to_stdout
  end

  it "shows a matching birthday" do
    create_one_matching_birthday
    expect { subject.check_birthday.first }.to output("It's John Adams's birthday today! They are 19 years old!\n").to_stdout
  end

  it "shows matching birthdays" do
    create_two_matched_birthdays
    expect { subject.check_birthday }.to output("It's John Adams's birthday today! They are 224 years old!\n" +
    "It's John Adams's birthday today! They are 224 years old!\n").to_stdout
  end  
  context "tests method with real birthday class" do

    it "adds birthday to the list" do
      subject.store(birthday_adams)
      expect(subject.list).to include(birthday_adams)
    end

    it "shows all birthdays" do
      data_for_show_all_birthdays
      expect { subject.view_all }.to output("Name: John Adams | Birthday: 10 January 1795\nName: May Day | Birthday: 17 January 2000\n").to_stdout
    end

    it "shows two matching birthdays" do
      data_two_matching_birthdays
      expect { subject.check_birthday } .to output("It's John Adams's birthday today! They are 224 years old!\n" +
      "It's May Day's birthday today! They are 19 years old!\n").to_stdout
    end

    it "shows nothing if no match" do
      add_one_non_matching_birthday
      expect(subject.check_birthday).to be_empty
    end
  end
end
