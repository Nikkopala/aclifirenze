class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
    	t.string :nikname
      t.string :society
      t.string :name
      t.string :surname
      t.string :hashed_password
      t.boolean :admin
      
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
