class Article < ActiveRecord::Base
	validates_uniqueness_of :society, :scope => [:title, :date]
	validates_format_of :image,
										:with => %r{\.(gif|jpg|png)$}i,
										:message => 'must be a URL for GIF, JPG ' + 'or PNG image.(gif|jpg|png)'
end
