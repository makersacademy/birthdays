require 'birthday'
require 'Date'

describe 'Birthday' do
  it 'can show the name' do
    birthday1 = Birthday.new("Amit Tauro", Date.new(1992,6,4))
    expect(birthday1.name).to eq("Amit Tauro")
  end

  it 'can show the fromatted_date' do
    birthday1 = Birthday.new("Amit Tauro", Date.new(1992,6,4))
    expect(birthday1.formatted_date).to eq("04/06/1992")
  end

  it 'can show the age' do
    birthday1 = Birthday.new("Amit Tauro", Date.new(1992,6,4))
    expect(birthday1.age).to eq("28")
  end

  it 'can show the right age' do
    birthday1 = Birthday.new("Amit Tauro", Date.new(1992,12,12))
    expect(birthday1.age).to eq("27")
  end

  it 'can handle lower case input' do
    birthday1 = Birthday.new("amit tauro", Date.new(1992,6,4))
    expect(birthday1.name).to eq("Amit Tauro")
  end
end
