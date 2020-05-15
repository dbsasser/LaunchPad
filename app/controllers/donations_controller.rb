class DonationsController < ApplicationController

    def new
        @campaign = Campaign.find_by(id: params[:campaign_id])
        @donation = @campaign.donations.build(user_id: current_user.id)
      end
    
      def create
        @donation = Donation.create(donation_params)
        if @donation.give_donation
          redirect_to campaign_path(@donation.campaign)
        else 
          render new_campaign_donation_path(@donation.campaign)
        end
      end
    
      private
      
      def donation_params
        params.require(:donation).permit(:amount, :user_id, :campaign_id)
      end

end
