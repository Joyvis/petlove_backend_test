require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe 'validating presence' do
    subject { create(:animal) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:monthly_cost) }
    it { is_expected.to validate_presence_of(:kind_cd) }
  end

  describe 'validating swallow rule' do
    let(:animal) { build(:animal, kind: :swallow, person: person) }
    subject do
      animal.valid?
    end

    context 'when a person is under 18 years old' do
      let(:person) { create(:person, born_date: '2015-01-01'.to_date) }

      it 'animal was not registered' do
        is_expected.to be_falsey
        expect(animal.errors.messages.keys).to include(:kind)
      end
    end
  end

  describe 'validating cat rule' do
    let(:animal) { build(:animal, kind: :cat, person: person) }

    subject do
      animal.valid?
    end

    context 'when the person`s name starts with the letter A' do
      let(:person) { create(:person, name: 'Arthur Dent') }

      it 'animal was not registered' do
        is_expected.to be_falsey
        expect(animal.errors.messages.keys).to include(:kind)
      end
    end
  end

  describe 'validating person total monthly cost' do
    before do
      create(:animal, monthly_cost: 2_000, person: person)
    end

    let(:animal) { build(:animal, person: person) }

    subject do
      animal.valid?
    end

    context 'when a person has a monthly cost over R$1000,00' do
      let(:person) { create(:person) }

      it 'animal was not registered' do
        is_expected.to be_falsey
        expect(animal.errors.messages.keys).to include(:person)
      end
    end
  end
end
