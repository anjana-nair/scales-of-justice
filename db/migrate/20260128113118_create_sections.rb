class CreateSections < ActiveRecord::Migration[7.2]
  def change
    create_table :sections do |t|
      t.references :act, null: false, foreign_key: true
      t.string :number
      t.text :description

      t.timestamps
    end
  end
end
