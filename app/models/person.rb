class Person < ApplicationRecord
  has_many :animals

  validates_presence_of :name, :born_date, :identification_document

  def age
    Time.zone.now.year - born_date.year
  end

  def animals_monthly_cost
    animals.sum(:monthly_cost)
  end
end
