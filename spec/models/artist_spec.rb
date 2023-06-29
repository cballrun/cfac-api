require 'rails_helper'

RSpec.describe Artist, type: :model do
  
  describe 'relationships' do
    it { should have_many :artist_events }
    it { should have_many(:events).through(:artist_events) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:logo) }
  end
end
