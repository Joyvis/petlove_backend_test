class PersonSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :identification_document, :born_date
end
