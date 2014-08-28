class Venue < ActiveRecord::Base
  has_many :bands
  has_many :reviews
  
  validates :name, :uniqueness => true
  
  extend Geocoder::Model::ActiveRecord

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  
  def inititalize
    
  end
  
  def location
    b = []
    b << latitude
    b << longitude
    Geocoder.coordinates(b)
  end
  
  def coords
    a = Geocoder.coordinates(name)
    lat = a[0]
    long = a[1]
    update(latitude: lat)
    update(longitude: long)
  end
  
  def list(l)
    id = l
    Band.where("venue_id = id")
  end
end