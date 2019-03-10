require 'birthday'
RSpec.describe Birthday do 

  #it { is_expected.to be_kind_of(Birthday)}
  
  it 'takes 3 arguments: first_name, second_name, birthday' do
    expect(Birthday).to respond_to(:new).with(3)
  end

  it 'returns a full name' do
    birthday = Birthday.new("John","Adams","17 May 2000")
    expect(birthday.name).to eq("#{birthday.first_name}  #{birthday.second_name}")
  end

  it 'returns its birthday' do
    birthday = Birthday.new("John","Adams","17 May 2000")
    expect(birthday.birthday).to eq("#{birthday.birthday}")
  end
end