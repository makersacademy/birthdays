class Birthday
    def initialize(date)
        split_dates = date.split("/")
        @day = date[0].to_i
        @month = date[1].to_i
        @year = date[2].to_i
    end
end