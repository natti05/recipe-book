class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.integer :servers
      t.string :difficulty
      t.integer :time
      t.integer :user_id
      t.timestamps
    end
  end
end
