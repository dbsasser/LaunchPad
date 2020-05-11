class DonationsController < ApplicationController

    def new
        @campaign = Campaign.find_by(id: params[:campaign_id])
        @donation = @campaign.donations.build(user_id: current_user.id)
      end
    
      def create
        @donation = Donation.new(donation_params)

        if @donation.save
            redirect_to @donation.campaign
        end
      end
    
      private
      
      def donation_params
        params.require(:donation).permit(:amount, :user_id, :campaign_id)
      end

end
