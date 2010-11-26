class Society < ActiveRecord::Base
	validates_uniqueness_of :society, :message => "E' già stata inserita questa società'"
	validates_uniqueness_of :email, :message => "L'email inserita è già utilizzata"
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => I18n.t ('email_format_error')
end
