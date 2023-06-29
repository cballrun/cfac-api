class Sponsor < ApplicationRecord
    has_many :sponsor_events
    has_many :events, :through => :sponsor_events
    validates_presence_of :name, :logo
end
