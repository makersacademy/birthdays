require 'birthday_list'


describe BirthdayList do
  it 'can create a list of birthdays' do
    #Arrange/Act
    birthdays = BirthdayList.new
    #Assert
    expect(birthdays).to be_a_kind_of(BirthdayList)
  end

  it 'responds to a method called add' do
    #Arrange/Act
    birthdays = BirthdayList.new
    #Assert
    expect(birthdays).to respond_to(:add)
  end

  it 'can add a birthday to a list of birthdays' do
    #Arrange
    birthdays = BirthdayList.new
    #Assert
    expect(birthdays.add).to include("12.05.1995")
  end

end
