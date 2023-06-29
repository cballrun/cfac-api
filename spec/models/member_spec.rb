require 'rails_helper'

RSpec.describe Member, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:photo) }
  end
end
