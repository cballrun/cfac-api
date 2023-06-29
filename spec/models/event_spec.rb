require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'relationships' do
    it { should have_many :artist_events }
    it { should have_many :sponsor_events }
    it { should have_many(:artists).through(:artist_events) }
    it { should have_many(:sponsors).through(:sponsor_events) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:description) }
  end
end
