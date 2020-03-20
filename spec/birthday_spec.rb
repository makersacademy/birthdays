require 'birthday'

describe Birthday do
  it 'stores a birthday when you create it' do
    birthday = Birthday.new("1st September")
    expect(Birthday).to respond_to(:new).with(1).argument 
  end
end