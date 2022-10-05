class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie = movie
    @days_rented = days_rented
  end

  def cost
    @cost ||=
      case movie.price_code
      when Movie::REGULAR
        regular_movie_rental_cost
      when Movie::NEW_RELEASE
        new_release_movie_cost
      when Movie::CHILDRENS
        childrens_movie_cost
      end
  end

  def regular_movie_rental_cost
    return 2 if days_rented < 2

    2 + ((days_rented - 2) * 1.5)
  end

  def new_release_movie_cost
    days_rented * 3
  end

  def childrens_movie_cost
    return 1.5 if days_rented < 3

    1.5 + ((days_rented - 3) * 1.5)
  end

  def frequent_renter_points
    return 2 if movie.price_code == Movie::NEW_RELEASE && days_rented > 1

    1
  end

  def display_cost
    "\t" + movie.title + "\t" + cost.to_s + "\n"
  end
end
