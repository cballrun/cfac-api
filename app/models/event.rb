class Event < ApplicationRecord
    has_many :artist_events
    has_many :sponsor_events
    has_many :vendor_events
    has_many :vendors, :through => :vendor_events
    has_many :artists, :through => :artist_events
    has_many :sponsors, :through => :sponsor_events
    validates_presence_of :name, :city, :state, :description 
end
