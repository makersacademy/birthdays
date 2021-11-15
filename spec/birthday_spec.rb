require 'birthday'

describe Birthday do
  it 'should be initialized with a name and a birthday' do
    my_birthday = Birthday.new("Lilly", "01/03/1989")
    expect(my_birthday.name).to eq("Lilly")
    expect(my_birthday.date).to eq("01/03/1989")
  end

  it "should calculate the person's age" do
    my_birthday = Birthday.new("Lilly", "01/03/1989")
    expect(my_birthday.age).to eq(32)
  end
end