class User < ActiveRecord::Base
  
  after_create :profile_create
  
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader
  
  has_many :books
  has_one  :profile
  has_many :comments
  has_many :tracks

  has_many :profile_comments, :as => :commentable
  has_many :profile_tracks, :as => :trackable

  has_many :authentications
  
  has_one :subscription
  
  has_many :user_badges
  has_many :badges, :through => :user_badges
  

  
  private
  
  def  profile_create
      self.create_profile
      self.subscription.create
  end
  
  def static_badge(*options)
      @badge = self.badges.new(options)
      @badge.type = "static"
      @badge.save
  end
  
  def send_subscription
      UserMailer.subscribtion(self).deliver
  end
  
end