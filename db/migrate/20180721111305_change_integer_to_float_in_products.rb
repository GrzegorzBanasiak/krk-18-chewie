class ChangeIntegerToFloatInProducts < ActiveRecord::Migration[5.2]
  def up
  	change_column :products, :calories, :float
  	change_column :products, :carbohydrates, :float
  	change_column :products, :protein, :float
  	change_column :products, :fat, :float
  end

  def down
  	change_column :products, :calories, :integer
  	change_column :products, :carbohydrates, :integer
  	change_column :products, :protein, :integer
  	change_column :products, :fat, :integer
  end
end
