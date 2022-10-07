require "spec_helper"
require "customer"
require "movie"
require "rental"
require "default_price"
require "regular_price"
require "new_release_price"
require "childrens_price"

RSpec.describe Customer do
  let(:name) { "John Doe" }
  let(:subject) { described_class.new(name) }
  let(:movie_one) { Movie.new("The Matrix", RegularPrice.new) }
  let(:movie_two) { Movie.new("Jeepers Creepers Reborn", NewReleasePrice.new) }
  let(:movie_three) { Movie.new("Moana", ChildrensPrice.new) }

  describe "#statement" do
    context "with no rentals" do
      it "returns the expected string" do
        expect(subject.statement).to(
          eq("Rental Record for John Doe\nAmount owed is 0\nYou earned 0 frequent renter points")
        )
      end
    end

    context "with rentals" do
      context "with longer rentals" do
        let(:rental_one) { Rental.new(movie_one, 7) }
        let(:rental_two) { Rental.new(movie_two, 7) }
        let(:rental_three) { Rental.new(movie_three, 7) }

        it "returns the expected string" do
          subject.add_rental(rental_one)
          subject.add_rental(rental_two)
          subject.add_rental(rental_three)

          expect(subject.statement).to(
            eq("Rental Record for John Doe\n\tThe Matrix\t9.5\n\tJeepers Creepers Reborn\t21\n\tMoana\t7.5\nAmount owed is 38.0\nYou earned 4 frequent renter points") # rubocop:disable Layout/LineLength
          )
        end
      end

      context "with short rentals" do
        let(:rental_one) { Rental.new(movie_one, 1) }
        let(:rental_two) { Rental.new(movie_two, 1) }
        let(:rental_three) { Rental.new(movie_three, 1) }

        it "returns the expected string" do
          subject.add_rental(rental_one)
          subject.add_rental(rental_two)
          subject.add_rental(rental_three)

          expect(subject.statement).to(
            eq("Rental Record for John Doe\n\tThe Matrix\t2\n\tJeepers Creepers Reborn\t3\n\tMoana\t1.5\nAmount owed is 6.5\nYou earned 3 frequent renter points") # rubocop:disable Layout/LineLength
          )
        end
      end
    end
  end
end
