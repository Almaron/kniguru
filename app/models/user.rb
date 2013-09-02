class User < ActiveRecord::Base
  
  after_create :profile_create
  
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader


  attr_accessor :agree , :need_agree

  validates :username, :presence => true, :uniqueness => true
  validates_presence_of :email
  validates_presence_of :password, :if => :new_record?
  validates_confirmation_of :password, :if => :password
  validates_presence_of :agree, :if => :need_agree, :message => "^Необходимо принять условия соглашения"

  has_one  :profile
  accepts_nested_attributes_for :profile
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
    return 30 unless self.birthday
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