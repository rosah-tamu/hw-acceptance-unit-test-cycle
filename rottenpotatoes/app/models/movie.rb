class Movie < ActiveRecord::Base
    
    def self.all_ratings
        %w(G PG PG-13 NC-17 R)
    end
    
    def self.find_similar director
		Movie.where(:director => director)
	end
	
	def self.where_director director
		Movie.where(:director => director)
	end
end
