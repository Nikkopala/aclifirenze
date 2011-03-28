class Society < ActiveRecord::Base
	validates_uniqueness_of :society
	validates_uniqueness_of :email
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => I18n.t('email_format_error')
	
	
	has_attached_file :photo, 
                    :styles => {
                    						:big =>  "400x400",
                    						:medium => "300x300>",
                                :thumb => "100x100>" }
                                 
                                 
end
