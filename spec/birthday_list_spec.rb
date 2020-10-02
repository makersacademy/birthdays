require "birthday_list"

# - Store all of my friends’ birthdays so I can keep track of them
# store_birthday("Karen", "23/05/1996")
# => "Karen's birthday has been stored!"
# store_birthday("Karen", "23/05/1996")
# => "Your friend's birthday is already stored!"

describe BirthdayList do
    before(:each) do
        @bday_list = BirthdayList.new
        @bday_list.store_birthday("Already Added", "06/08/1991")
    end

    it "verifies that a birthday has been stored" do
        expect(@bday_list.store_birthday("Karen", "23/05/1996")).to eq("Karen's birthday has been stored!")
    end
    
    it "tells you when a name has already been stored" do
        expect(@bday_list.store_birthday("Already Added", "06/08/1991")).to eq("Your friend's birthday is already stored!")
    end
end
