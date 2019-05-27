class Animal < ApplicationRecord
  belongs_to :person

  validates_presence_of :name, :monthly_cost, :kind_cd, :person_id

  with_options if: :valid_until_now? do
    validate :swallow_rule
    validate :cat_rule
    validate :person_monthly_cost
  end

  as_enum :kind, %i[horse dog parrot llama iguana platypus swallow cat]

  private

  def valid_until_now?
    errors.details.size.zero?
  end

  def swallow_rule
    if person.age < 18 && swallow?
      errors.add(:kind,
                 'to have a swallow it is necessary to be over 18 years old')
    end
  end

  def cat_rule
    if person.name.first.downcase == 'a' && cat?
      errors.add(:kind,
                 "people with names beginning with the letter A can not have \
                  cats")
    end
  end

  def person_monthly_cost
    if person.animals_monthly_cost > 1000
      errors.add(:person,
                 "people with a monthly cost above R$ 1000,00 can`1t have \
                  more animal")
    end
  end
end
