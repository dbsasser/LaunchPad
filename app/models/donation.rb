class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :campaign

  def give_donation(donation_params)
    if self.user.funds >= donation_params[:donation][:amount]
      self.user.funds -= donation_params[:donation][:amount]
      @donation = Donation.new(donation_params)
    end

    if @donation.save
      redirect_to @donation.campaign
    end
  end 

end
