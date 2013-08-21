class User < ActiveRecord::Base
  
  after_create :create_profile 
  
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  mount_uploader :avatar, AvatarUploader
  
  has_many :books
  has_one  :profile
  has_many :comments
  has_many :profile_comments, :as => :commentable
  has_many :profile_tracks, :as => :trackable
  
  has_one :subscription
  
  has_many :user_badges
  has_many :badges, :through => :user_badges
  
  has_many :tracks
  
  private
  
  def  create_profile
      self.profile.create!
      self.suscription.create
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