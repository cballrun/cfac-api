class Vendor < ApplicationRecord
    has_many :vendor_events
    has_many :events, :through => :vendor_events
end
