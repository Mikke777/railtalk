
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      # ...other devise fields...
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
