require 'birthday_list'
describe BirthdayList do
  it {is_expected.to respond_to(:add_birthday)}

  it "#add_birthday should store the birthday" do
    expect(BirthdayList.new.add_birthday("James")).to eq(["James"])
  end
end
