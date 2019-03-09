require 'birthday_list'

RSpec.describe Birthdays do

  it { is_expected.to be_kind_of(Birthdays) }
  context 'responds to these methods' do
    it { is_expected.to respond_to(:store).with(1) }
    it { is_expected.to respond_to(:view_all) }
    it { is_expected.to respond_to(:check_birthday) }
    it { is_expected.to respond_to(:age) }
  end

  it "adds a friend's birthday to a list" do
    friend = double
    subject.store(friend)
    expect(subject.list).to include(friend)
  end

  it "shows all the birthdays stored in the birthday list" do
    mock_class = instance_double(Birthdays)
    allow(mock_class).to receive(:view_all).and_return("Name: John Adam | Birthday: 10 January 1795\n""Name: May Day | Birthday: 10 January 1895")
    expect(mock_class.view_all).to eq( "Name: John Adam | Birthday: 10 January 1795\n""Name: May Day | Birthday: 10 January 1895")
  end


  it "shows a matching birthday" 


  context "can calculate the age of the matched person " do
    it "calculates the age" do

    end 
  end
end
