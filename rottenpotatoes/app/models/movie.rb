class Movie < ActiveRecord::Base
    def self.where_director director
        Movie.where(:director => director)
    end
    
    def self.movie_with_id(id) 
       Movie.where('id': id).pluck(:title)[0] 
    end

    def self.similar_to(id)
        director = Movie.where('id': id).pluck(:director)[0]
        if (director=="" || director==nil) 
            return ""
        else
            return Movie.where(:director => director)
        end
    end 
end
