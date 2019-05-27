people = [
  { name: 'Johnny Cash', identification_document: 555555555, born_date: '1932-02-26' },
  { name: 'Sid Vicious', identification_document: 555555555, born_date: '1957-05-10' },
  { name: 'Axl Rose', identification_document: 555555555, born_date: '1962-02-06' },
  { name: 'Joey Ramone', identification_document: 555555555, born_date: '1951-05-19' },
  { name: 'Bruce Dickinson', identification_document: 555555555, born_date: '1958-08-07' },
  { name: 'Kurt Cobain', identification_document: 555555555, born_date: '1967-02-20' },
  { name: 'Elvis Presley', identification_document: 555555555, born_date: '2008-08-17' }
]
puts 'Seeding People'
Person.create(people)
puts 'People seeded'

animals = [
  { name: 'Pé de Pano', monthly_cost: 199.99, kind: :horse, person_id: 1 },
  { name: 'Rex', monthly_cost: 99.99, kind: :dog, person_id: 2 },
  { name: 'Ajudante do Papai Noel', monthly_cost: 99.99, kind: :dog, person_id: 3 },
  { name: 'Rex', monthly_cost: 103.99, kind: :parrot, person_id: 4 },
  { name: 'Flora', monthly_cost: 103.99, kind: :llama, person_id: 5 },
  { name: 'Dino', monthly_cost: 177.99, kind: :iguaga, person_id: 6 },
  { name: 'Lassie', monthly_cost: 407.99, kind: :platypus, person_id: 7 }
]
puts 'Seeding Animals'
Animal.create(animals)
puts 'Animals seeded'
