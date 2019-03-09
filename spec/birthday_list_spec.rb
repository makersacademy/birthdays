require 'birthday_list'

RSpec.describe Birthdays do

  it { is_expected.to be_kind_of(Birthdays) }
  context 'responds to these methods' do
    it { is_expected.to respond_to(:add_birthday) }
    it { is_expected.to respond_to(:show_all) }
    it { is_expected.to respond_to(:match_birthday) }
    it { is_expected.to respond_to(:age) }
  end

  it "adds a friend's birthday to a list" do
    friend = double
    subject.add_birthday(friend)
    expect(subject.list).to include(friend)
  end

  it "shows all the birthdays stored in the birthday list"


  it "shows a matching birthday" 


  context "can calculate the age of the matched person " do
    it "calculates the age" do

    end 
  end
end
