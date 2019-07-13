class AddValidToJapans < ActiveRecord::Migration[5.2]
  def change
    add_column :japans, :selectee, :boolean, default: false
    add_column :japans, :validee, :boolean, default: false

  end
end
