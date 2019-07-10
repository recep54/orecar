class CreateJapans < ActiveRecord::Migration[5.2]
  def change
    create_table :japans do |t|
      t.integer :numcar
      t.string :model
      t.text :foto

      t.timestamps
    end
  end
end
