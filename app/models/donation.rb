class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  validates :amount, numericality: { only_iteger: true, greater_than: 0}
  validates :user_id, presence: true
  validates :campaign_id, presence: true

  def give_donation
    if self.user.funds >= self.amount
      self.user.funds -= self.amount
      self.user.save
    end
  end 

end
