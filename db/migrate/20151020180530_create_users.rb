class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :email
  		t.string :salt
  		t.string :encrypted_password
  		t.timestamps null: false
  	end
  end
end
