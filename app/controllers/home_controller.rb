class HomeController < ApplicationController

	def index
		@reportsprovinciali = Report.find_all_by_society("Acliprovinciale")
		@articlescircoli = Article.find(:all, :order => "date")
		@articlescircoli.each do |article|
			if article.date <= Time.now
					@articlescircoli.delete(article)
			end
		end
	end
	
end
