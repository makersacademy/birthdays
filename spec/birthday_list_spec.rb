require 'birthday_list'

describe Birthday do
  it 'stores the name and birthday' do
    expect(Birthday.add("Connor", "October")).to eq [{:name => "Connor", :birthday => "October"}]
  end

  it "stores name and birthday" do
    expect(Birthday.add("Michael", "April")).to eq [{:name => "Connor", :birthday => "October"}, {:name => "Michael", :birthday => "April"}]
  end
end
