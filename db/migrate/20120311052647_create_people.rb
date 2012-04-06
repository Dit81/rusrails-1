class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.datetime :birth_date
      t.references :city
      t.binary :picture
      t.boolean :activated
      
      
      t.timestamps
    end
  end
end
