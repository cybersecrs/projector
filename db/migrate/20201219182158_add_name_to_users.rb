class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nadimak, :string, null: false, default: ""
  end
end
