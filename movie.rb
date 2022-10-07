class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title, :price

  def price=(new_price)
    @price = new_price
  end

  def initialize(title, price)
    @title = title
    @price = price
  end

  def charge(days_rented)
    @charge ||= price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    @frequent_renter_points ||= price.frequent_renter_points(days_rented)
  end
end
