class AddBasicfieldsToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :phone_number
  		t.datetime :date_of_birth
  		t.string :gender, null: false, default: "Male"
  		t.string :name_of_sponsor
  		t.datetime :date_registered
  		t.boolean :is_admin
  	end
  end
end
