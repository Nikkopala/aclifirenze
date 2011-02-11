class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
  		t.string :society
      t.string :title
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
