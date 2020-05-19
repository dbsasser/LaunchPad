class ApplicationController < ActionController::Base
    

    def after_sign_in_path_for(resource)
        request.env['omniauth.origin'] || root_path
    end

    private

    def require_login 
        redirect_to new_user_session_path unless user_signed_in?
    end

    def set_campaign
        @campaign = Campaign.find_by(id: params[:id])
    end

    def authorize_campaign_creator
        redirect_to 'campaigns#index' unless @campaign.creator == current_user
    end


    
end
