class AddCategoryToCrimes < ActiveRecord::Migration[7.2]
  def change
    add_column :crimes, :category, :string
  end
end
