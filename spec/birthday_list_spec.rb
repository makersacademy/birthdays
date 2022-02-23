require 'birthday_list'
describe BirthdayList do
  context 'tests for birthday list functionalist' do
    let(:birthdaylist) {BirthdayList.new}
    it 'adds a birthday to the list' do
      birthdaylist.add_birthday('kenny', '01/12/1999')
      expect(birthdaylist.birthdays).to eq({"kenny"=>"01/12/1999"})
    end

    it 'displays all names with their birthday' do
      expect(birthdaylist.birthdays).to eq({})
    end

    it 'displays who has a birthday today' do
      birthdaylist.add_birthday('Kenny', '01/12/1999')
      expect {birthdaylist.todays_birthdays}.to output("It's Kenny's birthday today! They are 23 years old!\n").to_stdout
    end
  end
end
