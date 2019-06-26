require 'birthday_list.rb'

describe "add_birthday" do
  it "adds birthday hash to array" do
    expect(add_birthday("Tim Cole", "03/07/1985")).to eq [{name: "Tim Cole", birthday: "03/07/1985"}]
  end
end
