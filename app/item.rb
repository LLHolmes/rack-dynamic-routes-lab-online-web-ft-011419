class Item
  attr_accessor :name, :price
  
  @@all = []

  def initialize(name,price)
    @name = name
    @price = price
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find_by_name(name)
    self.all.detect { |i| i.name == name }
  end
    
end
