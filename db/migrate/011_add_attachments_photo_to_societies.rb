class AddAttachmentsPhotoToSocieties < ActiveRecord::Migration
  def self.up
    add_column :societies, :photo_file_name, :string
    add_column :societies, :photo_content_type, :string
    add_column :societies, :photo_file_size, :integer
    add_column :societies, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :societies, :photo_file_name
    remove_column :societies, :photo_content_type
    remove_column :societies, :photo_file_size
    remove_column :societies, :photo_updated_at
  end
end
