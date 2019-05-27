class AnimalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :monthly_cost, :kind_cd
end
