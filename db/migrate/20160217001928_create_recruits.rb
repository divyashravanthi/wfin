class CreateRecruits < ActiveRecord::Migration
  def change
    create_table :recruits do |t|
    	t.references :user, index: true, foreign_key: true
      t.references :recruited_user, index: true

      t.timestamps null: false
    end
    add_foreign_key :recruits, :users, column: :recruited_user_id
    add_index :recruits, [:user_id, :recruited_user_id], unique: true
  end
end
