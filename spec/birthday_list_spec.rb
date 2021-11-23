require 'birthday_list'

describe BirthdayList do
	subject {BirthdayList.new}

	context "initialization"
	it 'creates an instance of itself' do
		expect(subject).to be_an_instance_of(BirthdayList)
	end

	

end