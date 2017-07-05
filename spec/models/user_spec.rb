require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { create(:user) }
    
    it { is_expected.to have_many(:registered_applications) }
    it { is_expected.to validate_presence_of(:email) }
    
    # Shoulda tests for password
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }

end
