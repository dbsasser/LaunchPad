class RemoveDescriptionFromCampaigns < ActiveRecord::Migration[6.0]
  def change
    remove_column :campaigns, :description, :string
  end
end
