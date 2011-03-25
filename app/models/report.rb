class Report < ActiveRecord::Base
	#paperclip
	
	 has_attached_file :pdf, 
                    :styles => { :medium => "300x300>",
                                 :thumb => "100x100>" }
end
