class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :campaign

  def give_donation
    if self.user.funds >= self.amount
      self.user.funds -= self.amount
      self.save
    end
  end 

end
