class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_campaigns, class_name: "Campaign", foreign_key: "creator_id"
  has_many :donations 
  has_many :campaigns, through: :donations
  has_many :comments
end
