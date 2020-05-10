class Campaign < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: "creator_id"
  has_many :donations
  has_many :users, through: :donations
  has_many :comments
end
