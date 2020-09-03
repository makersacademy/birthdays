class Birthday

@birthday_list = []

  def self.add(name, birthday)
    @birthday_list << {:name => name, :birthday => birthday}
    @birthday_list
  end

end
