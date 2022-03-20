class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title, null: false, index: {unique: true}
      t.integer :cook_time, default: 0
      t.integer :prep_time, default: 0
      t.float :ratings, default: 0.0
      t.string :cuisine
      t.string :image
      t.string :category
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
