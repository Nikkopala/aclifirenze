class AddPresident < ActiveRecord::Migration
  def self.up
  	add_column :societies, :president, :string
  end

  def self.down
  	remove_column :societies, :president
  end
end
