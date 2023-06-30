class Artist < ApplicationRecord
    has_many :artist_events
    has_many :events, :through => :artist_events
    validates_presence_of :name, :logo

end
