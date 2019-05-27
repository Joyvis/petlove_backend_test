class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name, null: false
      t.float :monthly_cost, null: false
      t.integer :kind_cd, null: false
      t.references :person
      t.timestamps
    end
  end
end
