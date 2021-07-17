class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :sex
      t.string :breed
      t.float :current_weight
      t.date :birthdate
      t.integer :age

      t.timestamps
    end
  end
end
