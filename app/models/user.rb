class User < ActiveRecord::Base
  has_many :services
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :nickname, :provider, :url, :username
 def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    # if user = User.where(:url => access_token.info.urls.Facebook).first
      # user
    # else 
      # # User.create!(:provider => access_token.provider, :url => access_token.info.urls.Facebook, :username => access_token.extra.raw_info.name, :nickname => access_token.extra.raw_info.username, :email => access_token.extra.raw_info.email, :password => Devise.friendly_token[0,20]) 
    # end
  service = Service.where(:provider => auth.provider, :uid => auth.uid).first
  user = service.user if service
  # user = User.where(:provider => auth.provider, :uid => auth.uid).first
  unless user
    user = User.create(username:auth.extra.raw_info.name,
                         provider:auth.provider,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                         )
    # service = user.services.create(
    service = Service.create(user_id: user.id,
                         uname: auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         uemail:auth.info.email
                         )
  end
  user
  end
end
