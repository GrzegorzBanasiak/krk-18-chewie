class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparation_time
      t.string :difficulty

      t.timestamps
    end
  end
end
