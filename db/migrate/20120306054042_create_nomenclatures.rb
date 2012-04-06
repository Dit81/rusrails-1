class CreateNomenclatures < ActiveRecord::Migration
  def change
    create_table :nomenclatures do |t|
      t.string :name
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
