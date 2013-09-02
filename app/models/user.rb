class User < ActiveRecord::Base
  
  after_create :profile_create
  
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader

  validates_confirmation_of :password, :if => :password

  has_one  :profile
  has_one :subscription

  has_many :books
  has_many :comments
  has_many :tracks

  has_many :book_tracks

  has_many :profile_comments, :as => :commentable
  has_many :profile_tracks, :as => :trackable

  has_many :authentications

  has_many :user_badges
  has_many :badges, :through => :user_badges

  def full_name
    self.profile.first_name.present? && self.profile.last_name.present? ? "#{self.profile.first_name} #{self.profile.last_name}" : self.username.capitalize
  end

  def age
    age = Date.today.year - self.birthday.year
    age -= Date.today < self.birthday + age.years ? 1 : 0
  end

  def young?
    self.age <= 16
  end
  
  private
  
  def  profile_create
      self.create_profile
      self.create_subscription
  end
  
  def static_badge(*options)
      @badge = self.badges.new(self,options)
      @badge.type = "static"
      @badge.save
  end
  
  def send_subscription
      UserMailer.subscribtion(self).deliver
  end
  
end