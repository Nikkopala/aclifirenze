require 'digest/sha1'

class User < ActiveRecord::Base
  attr_accessor :password_confirmation
  validates_confirmation_of :password, :message => "Le password inserite sono differenti"
    

	def password
    @password
  end
  
  def password=(psw)
    @password = psw
    return if psw.blank?
    self.hashed_password = Digest::SHA1.hexdigest(psw)
  end
  
  def self.check_login(name, password)
    #~ user=self.find_by_name(name)
    user=self.find(:all, :conditions => {:name=>name, :hashed_password =>Digest::SHA1.hexdigest(password)}).first
    #~ if user
    	#~ if user.hashed_password!=password
    		#~ user=nil
    	#~ end
    #~ end
   	return user
    #return self.where(:name => name).where(:hashed_password => Digest::SHA1.hexdigest(password)).first
  end
end
