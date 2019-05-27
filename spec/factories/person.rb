# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    name { 'Elvis Presley' }
    identification_document { '122354654' }
    born_date { '1995-01-01'.to_date }
  end
end
