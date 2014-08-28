require "rubygems"
require "bundler"

Bundler.require

require_relative "./models/band.rb"
require_relative "./models/genre.rb"
require_relative "./models/venue.rb"
require_relative "./models/user.rb"
require_relative "./models/review.rb"

# User.delete_all
# Venue.delete_all

# home
get "/" do
  erb :home
end

# Lists Users
get "/users" do
  @users = User.all
  erb :users
end

# Venue list with NO user
get "/venues" do
  @venues = Venue.all
  # Link back to home page with NO user
  erb :venues
end

# Venue list WITH a user
get "/user/:user_id/venues" do
  @venues = Venue.all
  # Add new venue
  # Add new band for a venue
  # Link back to USER home page
  erb :user_venues
end

# Add User
get "/add_user" do
  erb :add_user
end

# Create User
post "/create_user" do
  # Creates new user
  @user = User.create(name: params[:name])
  # Redirects to user homepage
  erb :create_user
end

# User Home
get "/user/:user_id/home" do
  @user = User.find(params[:user_id])
  @reviews = Review.find(review_id: @user.id)
  # Lists user name
  # Lists all venues for user
  # Lists all reviews for user
  # Add new venue
  # list ALL venues
  erb :user_home
end

# Adds a new band for a venue
get "/:venue_id/add_band" do
  # Creates a new band for venue
  erb :add_band
end




















# # Deletes all of the rows in the venues table each time you start the application.
#
# # Routes you to the home.erb.
# get "/" do
#   erb :home
# end
#
# # Sets @venues variable to all of the venues in the venues table.
# #
# # Routes you to venues.erb.
# get "/venues" do
#   @venues = Venue.all
#   erb :venues
# end
#
# # Routes you to add_user.erb
# get "/add_user" do
#   erb :add_user
# end
#
# # Routes you to add_venue.erb
# get "/add_venue" do
#   erb :add_venue
# end
#
# post "/create_venue" do
#   @venue = Venue.create(name: params[:venue])
#   @venue.coords
#   @venue.location
#   @venues = Venue.all
#
#   erb :venues
# end
#
# get "/users" do
#   @users = User.all
#   erb :users
# end
#
# # Sets @venue to a specific venue.id from params that is selected in venues.erb.
# #
# # Routes you to edit.erb.
# get "/edit/:venue_id" do
#   @venue = Venue.find(params[:venue_id])
#
#   erb :edit
# end
#
# # Creates new user
# #
# # Routes you to ???
# post "/create_user" do
#   @user = User.create(name: params[:name])
#   erb :user_home
# end
#
# get "/user/:user_id/home" do
#   @user = User.find(params[:user_id])
#   @user_venue = Venue.find(venue_id: @user.id)
#   erb :user_home
# end
#
# # Creates the @venue from params that user inputs in add.erb.
# # From the name attribute, gets the coordinates using geocoder / .coords method => venue.rb
# # From the .coords method, gets the location/address using geocoder / .location method => venue.rb
# # Sets @venues variable to all of the venues in the venues table.
# #
# # Routes to venues.erb.
#
#
# # post "/create" do
# #   @venue = Venue.create(name: params[:venue])
# #   @venue.coords
# #   @venue.location
# #   @venues = Venue.all
# #
# #   erb :venues
# # end
#
#
#
# # Sets @venue to a specific venue.id from params that is selected in venues.erb.
# # @bands = Finds each band in the bands table that is playing at the venue in @venue.
# # Creates empty instance variable @genre hash.
# # Creates empty local variable gen array.
# #
# # Loops groups @bands and puts the genre in the local gen array.
# # Also, takes those genres and partners it with the band name key in @genre.
# #
# # Routes you to info.erb.
# get "/venues/:venue_id" do
#   @venue = Venue.find(params[:venue_id])
#   @bands = Band.where(venue_id: @venue.id)
#
#   @genre = {}
#
#   gen = []
#
#   @bands.each do |b|
#     gen = b.genres
#     @genre[b.name] = gen
#   end
#
#   erb :info
# end
#
# # Selects venue.id from params and sets it to the @venue variable.
# # Creates empty instance variable @old array.
# # Pushes the name and address into the @old array.
# #
# # Updates the venue table with the new name and address in params.
# #
# # Routes you to update.erb.
#
#
# post "/edit/:venue_id/update" do
#   @venue = Venue.find(params[:venue_id])
#   @old = []
#   @old << @venue.name
#   @old << @venue.address
#   @venue.update_attributes({name: params[:name], address: params[:address]})
#   binding.pry
#   erb :update
# end