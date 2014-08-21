class Band < ActiveRecord::Base
  has_and_belongs_to_many :genres
  belongs_to :venues
  
  def initialize
    
  end
end