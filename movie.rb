class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title, :price_code, :price

  def price_code=(new_price_code)
    @price_code = new_price_code
    @price =
      case price_code
      when REGULAR
        RegularPrice.new
      when NEW_RELEASE
        NewReleasePrice.new
      when CHILDRENS
        ChildrensPrice.new
      end
  end

  def initialize(title, initial_price_code)
    @title = title
    self.price_code = initial_price_code
  end

  def charge(days_rented)
    @charge ||= price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    @frequent_renter_points ||= price.frequent_renter_points(days_rented)
  end
end
