require 'birthday'

describe Birthday do
  it 'stores a name' do
    name = "Mary Poppins"
    expect { Birthday.new(name) }.not_to raise_error
  end
end