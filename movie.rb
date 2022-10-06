class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title, :price_code

  def price_code=(new_price_code)
    price_code = new_price_code
  end

  def initialize(title, initial_price_code)
    @title = title
    @price_code = initial_price_code
  end

  def charge(days_rented)
    @charge ||=
      case price_code
      when REGULAR
        return 2 if days_rented < 2

        2 + ((days_rented - 2) * 1.5)
      when NEW_RELEASE
        days_rented * 3
      when CHILDRENS
        return 1.5 if days_rented < 3

        1.5 + ((days_rented - 3) * 1.5)
      end
  end

  def frequent_renter_points(days_rented)
    return 2 if price_code == NEW_RELEASE && days_rented > 1

    1
  end
end
