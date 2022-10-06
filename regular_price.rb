class RegularPrice
  def charge(days_rented)
    return 2 if days_rented <= 2

    2 + ((days_rented - 2) * 1.5)
  end
end
