require "rubygems"
require "bundler"

Bundler.require

require_relative "./models/band.rb"
require_relative "./models/genre.rb"
require_relative "./models/venue.rb"

# Deletes all of the rows in the venues table each time you start the application.

# Routes you to the home.erb.
get "/" do
  erb :home
end

# Sets @venues variable to all of the venues in the venues table.
#
# Routes you to venues.erb.
get "/venues" do
  @venues = Venue.all
  
  erb :venues
end

# Routes you to add.erb.
get "/add" do
  erb :add_user
end

# Sets @venue to a specific venue.id from params that is selected in venues.erb.
#
# Routes you to edit.erb.
get "/edit/:venue_id" do
  @venue = Venue.find(params[:venue_id])
  
  erb :edit
end

post "/create_user" do
  @user = User.create(name: params[:name])
  
  
end

# Creates the @venue from params that user inputs in add.erb.
# From the name attribute, gets the coordinates using geocoder / .coords method => venue.rb
# From the .coords method, gets the location/address using geocoder / .location method => venue.rb
# Sets @venues variable to all of the venues in the venues table.
#
# Routes to venues.erb.
post "/create" do
  @venue = Venue.create(name: params[:venue])
  @venue.coords
  @venue.location
  @venues = Venue.all
  
  erb :venues
end

# Sets @venue to a specific venue.id from params that is selected in venues.erb.
# @bands = Finds each band in the bands table that is playing at the venue in @venue.
# Creates empty instance variable @genre hash.
# Creates empty local variable gen array.
#
# Loops groups @bands and puts the genre in the local gen array.
# Also, takes those genres and partners it with the band name key in @genre.
#
# Routes you to info.erb.
get "/venues/:venue_id" do
  @venue = Venue.find(params[:venue_id])
  @bands = Band.where(venue_id: @venue.id)
  
  @genre = {}
  
  gen = []
  
  @bands.each do |b|
    gen = b.genres
    @genre[b.name] = gen
  end
  
  erb :info
end

# Selects venue.id from params and sets it to the @venue variable.
# Creates empty instance variable @old array.
# Pushes the name and address into the @old array.
#
# Updates the venue table with the new name and address in params.
#
# Routes you to update.erb.


post "/edit/:venue_id/update" do 
  @venue = Venue.find(params[:venue_id])
  @old = []
  @old << @venue.name
  @old << @venue.address
  @venue.update_attributes({name: params[:name], address: params[:address]})
  binding.pry
  erb :update
end