class CreateUsers < ActiveRecord::Migration[7.1]
  def change
   
    create_table :users do |t|
      t.string :name
      t.string :email, null: false#, unique: true
      t.string :api_token#, unique: true

      t.timestamps
    end

 #   add_index :users, :email, unique: true
 #   add_index :users, :api_token, unique: true
 
  end
end
