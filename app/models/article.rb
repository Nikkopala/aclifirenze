class Article < ActiveRecord::Base
	validates_uniqueness_of :society, :scope => [:title, :date]
	validates_presence_of :date
	validates_presence_of :title
	
	# Paperclip
  has_attached_file :photo, 
  	:styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }
      
  has_attached_file :pdf, 
                    :styles => { :medium => "300x300>",
                                 :thumb => "100x100>" }
end
