class VendorEvent < ApplicationRecord
  belongs_to :vendor
  belongs_to :event
end
