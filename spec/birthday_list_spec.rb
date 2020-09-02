require 'birthday_list'

describe "store_birthday method" do
  it "returns a success message" do
    expect(store_birthday).to eq "Birthday stored!"
  end
end

