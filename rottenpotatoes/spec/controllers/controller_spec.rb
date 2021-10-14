require 'rails_helper'
require 'spec_helper'



describe MoviesController, :type => :controller do
	before(:all) do
			@movie1 = Movie.create!(:director => "Darren Aronofsky")
			@movie2 = Movie.create!(:director => "David Fincher")
			@movie3 = Movie.create!(:director => "")
			@movie4 = Movie.create!(:director => "Darren Aronofsky")
	end
	describe "GET index" do
        it "return all movies" do
            get :index
            expect(assigns[:movies]).to include(@movie1)
        end

        it "should render template" do

            get :index

            expect(response).to render_template("index")
        end
  end

  describe "GET show" do
        it "show one specific movie" do
            get :show, :id => @movie1.id
            expect(assigns[:movie]).to eq(@movie1) 
            expect(response).to render_template("show")
        end
  end

	describe "GET new" do
				it "returns new movie edge" do
						get :new
						expect(response).to render_template("new")
				end
	end

	describe "GET edit" do
        it "should render to edit template" do
            get :edit, :id => @movie1.id
            expect(response).to render_template("edit")
        end

    end

	describe "PUT update" do
        it "should change movie attribute and redirects" do
            put :update ,  :id => @movie1.id, :movie=> { title: "Black Swan", rating: "R" }
            expect(assigns[:movie].title).to eq("Black Swan")
            expect(assigns[:movie].rating).to eq("R")
            expect(response).to redirect_to movie_path(@movie1)
        end
    end

	describe "GET similar" do
			context "given movie has a director" do
				it "returns all movies with same director" do
					get :similar, :id => @movie1.id
					 expect(response).to render_template("similar")
				end
			end

			context "given movie has no directors - sad path" do
				it "returns to index page" do
					get :similar, :id => @movie3.id
					 expect(response).to redirect_to movies_path
				end
			end
	end
end