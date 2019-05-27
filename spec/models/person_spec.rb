require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'validating' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:identification_document) }
    it { is_expected.to validate_presence_of(:born_date) }
  end
end
