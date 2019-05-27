# frozen_string_literal: true

FactoryBot.define do
  factory :animal do
    name { 'Rex' }
    monthly_cost { 150 }
    kind_cd { 0 }
    person { create(:person) }
  end
end
