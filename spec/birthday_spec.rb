require 'birthday'
RSpec.describe Birthday do 

  #it { is_expected.to be_kind_of(Birthday)}
  
  it 'takes 3 arguments: first_name, second_name, birthday' do
    expect(Birthday).to respond_to(:new).with(3)
  end
end