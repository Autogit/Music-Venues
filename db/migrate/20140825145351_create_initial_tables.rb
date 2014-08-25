class CreateInitialTables < ActiveRecord::Migration
  def change
    
    
    create_table :users do |t|
      t.string :name
    end
    
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :venue_id
      t.text :content
    end
    
    create_table :bands do |t|
      t.string :name
      t.integer :venue_id
    end
    
    create_table :venues do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.text :address
    end
    
    create_table :genres do |t|
      t.string :name
    end
    
    create_table :bands_genres do |t|
      t.integer :band_id
      t.integer :genre_id
    end
    
  end
end
