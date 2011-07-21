class AddUserIdToContacts < ActiveRecord::Migration
  def self.up
    change_table :contacts do |t|
      t.integer :user_id
    end
  end

  def self.down
    remove_column :contacts, :user_id
  end
end
