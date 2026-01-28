class CreateActs < ActiveRecord::Migration[7.2]
  def change
    create_table :acts do |t|
      t.string :name
      t.string :short_name

      t.timestamps
    end
  end
end
