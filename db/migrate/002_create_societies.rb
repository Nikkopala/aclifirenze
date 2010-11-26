class CreateSocieties < ActiveRecord::Migration
  def self.up
    create_table :societies do |t|
      t.string :society
      t.text :base
      t.string :email
      t.string :tel
      t.string :opening_time

      t.timestamps
    end
  end

  def self.down
    drop_table :societies
  end
end
