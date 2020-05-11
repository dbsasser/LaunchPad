class CommentsController < ApplicationController
    def new
        @comment = Comment.new(campaign_id: params[:campaign_id], user_id: current_user.id)
    end

    def create 
        @comment = Comment.new(comment_params)
        
        if @comment.save
            redirect_to @comment.campaign
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :campaign_id, :user_id)
    end
end
