class AddPhoneNumberToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :phone_number
    end
  end

  def self.down
    remove_column :users, :phone_number
  end
end
