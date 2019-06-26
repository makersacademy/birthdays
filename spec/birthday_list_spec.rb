require 'birthday_list.rb'

describe "add a birthday" do
  it "adds birthday hash to array" do
    new_list = BirthDayList.new
    expect(new_list.add("Tim Cole", "03/07/1985")).to eq [{ name: "Tim Cole", birthday: "03/07/1985" }]
  end
end

describe "add 2 birthdays" do
  it "adds 2nd birthday to array" do
    new_list = BirthDayList.new
    new_list.add("Tim Cole", "03/07/1985")
    result = new_list.add("Lucy Cole", "08/09/1983")
    expected = [{ name: "Tim Cole", birthday: "03/07/1985" }, { name: "Lucy Cole", birthday: "08/09/1983" }]
    expect(result).to eq expected
  end
end

describe "show list" do
  it "displays list in pleasant format" do
    new_list = BirthDayList.new
    new_list.add("Tim Cole", "03/07/1985")
    new_list.add("Lucy Cole", "08/09/1983")
    expect { new_list.show }.to output("Tim Cole: 03/07/1985\nLucy Cole: 08/09/1983\n").to_stdout
  end
end

describe "shows current birthdays" do
  it "displays birthday message if today is birthday" do
    new_list = BirthDayList.new
    new_list.add("Tim Cole", "03/07/1985")
    new_list.add("Lucy Cole", "08/09/1983")
    new_list.add("Birthday Boy", "26/06/1984")
    expect { new_list.current_birthdays }.to output("Lucky Birthday Boy, today they're 35 years old!\n").to_stdout
  end
end
