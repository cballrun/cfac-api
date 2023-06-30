require 'rails_helper'

RSpec.describe Vendor, type: :model do
  describe 'relationships' do
    it { should have_many :vendor_events }
    it { should have_many(:events).through(:vendor_events) }
  end
end
