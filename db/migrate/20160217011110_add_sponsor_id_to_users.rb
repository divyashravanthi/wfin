class AddSponsorIdToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.integer :sponsor_id
  	end
  end
end
