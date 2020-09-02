require 'birthday_list'

describe 'store birthdays' do
  it 'stores the name and birthday' do
    expect(add("Connor", "October")).to eq [{:name => "Connor", :birthday => "October"}]
  end 
end
