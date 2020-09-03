require 'birthday_list'

describe Birthday do

  it 'stores first name and birthday' do
    birthday_list = Birthday.new
    expect(birthday_list.add("Connor", "October")).to eq [{:name => "Connor", :birthday => "October"}]
  end

  it "stores second name and birthday" do
    birthday_list = Birthday.new
    birthday_list.add("Connor", "October")
    expect(birthday_list.add("Michael", "April")).to eq [{:name => "Connor", :birthday => "October"}, {:name => "Michael", :birthday => "April"}]
  end

  it "prints out each name and birthday on a seperate line" do
    birthday_list = Birthday.new
    birthday_list.add("Connor", "October")
    birthday_list.add("Michael", "April")
    expect{birthday_list.print_list}.to output("Connor, October\nMichael, April\n").to_stdout
  end
end
