require 'rails_helper'

RSpec.describe SponsorEvent, type: :model do

  describe 'relationships' do
    it { should belong_to :event }
    it { should belong_to :sponsor }
  end
end
