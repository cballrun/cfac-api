require 'rails_helper'

RSpec.describe Sponsor, type: :model do
    
  describe 'relationships' do
    it { should have_many :sponsor_events }
    it { should have_many(:events).through(:sponsor_events) }
  end
  
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:logo) }
  end
end
