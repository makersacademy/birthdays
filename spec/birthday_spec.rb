require 'birthday'

describe Birthday do
    it "gets a written date" do
        bday = Birthday.new("Duckie","23/10/1993")
        expect(bday.written_date).to eq("October 23, 1993")
    end
end