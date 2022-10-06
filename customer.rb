class Customer
  attr_reader :name, :rentals

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    rentals << arg
  end

  def statement
    frequent_renter_points = 0
    total_rental_cost = 0
    result = statement_header
    rentals.each do |rental|
      result += rental.display_cost
      total_rental_cost += rental.charge
      frequent_renter_points += rental.frequent_renter_points
    end
    result += statement_footer(total_rental_cost, frequent_renter_points)
    result
  end

  def statement_header
    "Rental Record for #{name}\n"
  end

  def statement_footer(total_rental_cost, frequent_renter_points)
    "Amount owed is #{total_rental_cost}\nYou earned #{frequent_renter_points} frequent renter points"
  end
end
