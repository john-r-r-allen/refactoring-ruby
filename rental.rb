class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie = movie
    @days_rented = days_rented
  end

  def charge
    movie.charge(days_rented)
  end

  def frequent_renter_points
    return 2 if movie.price_code == Movie::NEW_RELEASE && days_rented > 1

    1
  end

  def display_cost
    "\t" + movie.title + "\t" + charge.to_s + "\n"
  end
end
