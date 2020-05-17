class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  validates :content, presence: true
  validates :user_id, presence: true
  validates :campaign_id, presence: true
end
