class Article < ActiveRecord::Base
	validates_uniqueness_of :society, :scope => [:title, :date]
	
	# Paperclip
  has_attached_file :photo, 
  	:styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }
end
