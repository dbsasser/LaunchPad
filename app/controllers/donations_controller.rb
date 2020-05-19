class DonationsController < ApplicationController
    
    before_action :require_login, only: [:new, :create]

    def new
      @campaign = Campaign.find_by(id: params[:campaign_id])
      @donation = @campaign.donations.build(user_id: current_user.id)
    end
    
    def create
      @donation = Donation.new(donation_params)
      @donation.give_donation && @donation.save
      if @donation.give_donation
        redirect_to campaign_path(@donation.campaign)
      else
        @msg = "Sorry, you don't have enough funds for that." 
        render 'new'
      end
    end

    def index
      @campaign = Campaign.find_by(id: params[:campaign_id])
    end


    
      private
      
      def donation_params
        params.require(:donation).permit(:amount, :user_id, :campaign_id)
      end

end
