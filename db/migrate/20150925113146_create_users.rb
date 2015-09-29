class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :email
      t.string :name, null: false
      t.string :provider
      t.string :uid

    end

    add_index :users, :email,                unique: true
    add_index :users, :uid
    add_index :users, :provider

  end


end
