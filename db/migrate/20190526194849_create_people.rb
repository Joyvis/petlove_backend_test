class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :identification_document, null: false
      t.date :born_date, null: false
      t.timestamps
    end
  end
end
