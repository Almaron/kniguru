class Subscription < ActiveRecord::Base
    
  belongs_to :user
  
  scope :current, -> {where("hour IN (24, ?) AND day IN (7, ?)", Time.now.hour, Date.today.wday)}
  
  def self.send_current
     self.current.each { |sub| sub.user.send_subscribtion }
  end
  
end
