class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]


  has_many :created_campaigns, class_name: "Campaign", foreign_key: "creator_id"
  has_many :donations 
  has_many :campaigns, through: :donations
  has_many :comments
  validates :name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.photo = auth.info.image
      user.password = Devise.friendly_token[0,20]
    end      
  end
end
