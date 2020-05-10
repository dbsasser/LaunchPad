class CampaignsController < ApplicationController

    def new 
        @campaign = Campaign.new
    end 

    def create
        @campaign = current_user.created_campaigns.build(campaign_params)

        if @campaign.save
            redirect_to campaign_path(@campaign)
        else
            render 'new'
        end
    end

    private 

    def campaign_params
        params.require(:campaign).permit(:title, :description, :goal, :picture)
    end

end
