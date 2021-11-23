require 'birthday_list'

describe BirthdayList do
	subject {BirthdayList.new}

	context "initialization"
	it 'creates an instance of itself' do
		expect(subject).to be_an_instance_of(BirthdayList)
	end

	context "Array as the birthday list"
	it 'creates an empty array of birthdays when instantiated' do
		expect(subject.birthdays).to eq ([])
	end
	

end