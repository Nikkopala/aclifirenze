class HomeController < ApplicationController

	def index
		@reportsprovinciali = Report.find_all_by_society("Acliprovinciale")
		@articlescircoli = Article.find(:all, :conditions => ['date >= ? ', Time.now], :order => :date, :limit => 10)
		
	end

end
