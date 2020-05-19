class CampaignsController < ApplicationController
    def newest
        @campaigns = Campaign.order(created_at: :desc)
    end
    
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

    def show
        @campaign = Campaign.find_by(id: params[:id])
        if user_signed_in?
            @comment = @campaign.comments.new(user_id: current_user.id)
        end
    end

    def index
        @campaigns = Campaign.all
    end

    def edit
        @campaign = Campaign.find_by(id: params[:id])
    end

    def update 
        @campaign = Campaign.find_by(id: params[:id])
        if @campaign.update(campaign_params)
            redirect_to campaign_path(@campaign)
        else 
            render 'edit'
        end
    end

    def most_raised
        # @campaigns = Campaign.all.sort_by { |n| n.donations.sum(:amount) }
        @campaigns = Campaign.joins(:donations).group(:campaign_id).order("sum_amount DESC").sum(:amount)
    end

    def funded 
        @campaigns = Campaign.all.select { |n| n.donations.sum(:amount) >=  n.goal }
    end

    private 

    def campaign_params
        params.require(:campaign).permit(:title, :description, :goal, :picture)
    end

end
