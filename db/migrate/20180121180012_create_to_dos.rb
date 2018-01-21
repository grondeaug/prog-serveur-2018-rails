class CreateToDos < ActiveRecord::Migration[5.1]
  def change
    create_table :to_dos do |t|
      t.string :owner
      t.boolean :valide
      t.string :content

      t.timestamps
    end
  end
end
