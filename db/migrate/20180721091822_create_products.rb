class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :calories
      t.integer :carbohydrates
      t.integer :protein
      t.integer :fat

      t.timestamps
    end
  end
end
