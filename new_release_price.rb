class NewReleasePrice
  def charge(days_rented)
    days_rented * 3
  end

  def frequent_renter_points(days_rented)
    return 2 if days_rented > 1

    1
  end
end
