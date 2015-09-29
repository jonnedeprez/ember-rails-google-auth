class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :email,              null: false, default: ""
      t.string :name
      t.string :provider
      t.string :uid

    end

    add_index :users, :email,                unique: true
    add_index :users, :uid
    add_index :users, :provider

  end


end
