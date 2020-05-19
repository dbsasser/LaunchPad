class CampaignsController < ApplicationController
    before_action :set_campaign, only: [:show, :edit, :update]
    before_action :require_login, only: [:new, :create, :edit, :update]
    before_action :authorize_campaign_creator, only: [:edit, :update]
    
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
        if user_signed_in?
            @comment = @campaign.comments.new(user_id: current_user.id)
        end
    end

    def index
        @campaigns = Campaign.all
    end

    def edit
    end

    def update 
        if @campaign.update(campaign_params)
            redirect_to campaign_path(@campaign)
        else 
            render 'edit'
        end
    end

    def most_raised
        # @campaigns = Campaign.all.sort_by { |n| n.donations.sum(:amount) }
        # @campaigns = Campaign.joins(:donations).group(:campaign_id).order("sum_amount DESC").sum(:amount)
        @campaigns = Campaign.most_raised
    end

    def funded 
        @campaigns = Campaign.all.select { |n| n.donations.sum(:amount) >=  n.goal }
    end

    private 

    def campaign_params
        params.require(:campaign).permit(:title, :description, :goal, :picture)
    end

end
