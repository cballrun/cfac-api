class SponsorEvent < ApplicationRecord
  belongs_to :sponsor
  belongs_to :event
end
