class AddSenderIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sender_id, :integer
    add_column :users, :recipient_id, :integer
    add_index :users, :sender_id
  end
end
