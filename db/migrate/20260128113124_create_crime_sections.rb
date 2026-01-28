class CreateCrimeSections < ActiveRecord::Migration[7.2]
  def change
    create_table :crime_sections do |t|
      t.references :crime, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
