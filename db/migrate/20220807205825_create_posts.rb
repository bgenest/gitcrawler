class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :language, null: false
      t.string :primary_contributers, null: false

      t.timestamps null: false
    end
  end
end
