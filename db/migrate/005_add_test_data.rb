class AddTestData < ActiveRecord::Migration
  def self.up
	User.delete_all
	Article.delete_all
	Society.delete_all
	
	User.create(:society=>'Colonnata',
	:name=>'Francesco', :surname=>'Potestio',
	:hashed_password=>'d012f68144ed0f121d3cc330a17eec528c2e7d59')
	
	Society.create(:society=>'Colonnata',
	:base=>%{<p>VIA GINORI,50 - 50019 SESTO FIORENTINO (FI) </p>}, 
	:email=>'colonnata@aclifirenze.it', :tel=>'0554487659', :opening_time=>'')
	
	Article.create(:society=>'Colonnata', :title=>'Festa del socio', 
	:date=>10/12/2010, 
	:description=>%{<p>Si mangia da Dio 15 euro </p>}, 
	:image=>'http://www.acliservicesardegna.com/acli_33169.jpg')
  end

  def self.down
	User.delete_all
	Article.delete_all
	Society.delete_all
  end
end
