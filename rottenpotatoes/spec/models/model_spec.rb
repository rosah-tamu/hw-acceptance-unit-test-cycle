require 'rails_helper'

describe "Search movies having same director" do
		before(:all) do
			@movie1 = Movie.create!(:director => "Darren Aronofsky")
			@movie2 = Movie.create!(:director => "David Fincher")
			@movie3 = Movie.create!(:director => "")
			@movie4 = Movie.create!(:director => "Darren Aronofsky")
		end
		it 'should find movies with same director' do
			 expect(Movie.find_similar(@movie1[:director])).to include(@movie4)
			 expect(Movie.find_similar(@movie4[:director])).to include(@movie1)
		end

		it 'should not find movies with different director' do
			 expect(Movie.find_similar(@movie1[:director])).to_not include(@movie2)
		end

		it 'should not find anything given a movie with empty director' do
			expect(Movie.find_similar(@movie3[:director])).to_not include(@movie2)
			expect(Movie.find_similar(@movie3[:director])).to_not include(@movie1)
		end

  end