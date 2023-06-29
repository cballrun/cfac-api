require 'rails_helper'

RSpec.describe VendorEvent, type: :model do
  describe 'relationships' do
    it { should belong_to :vendor }
    it { should belong_to :event }
  end
end
