class AddCreatorIdToCampaigns < ActiveRecord::Migration[6.0]
  def change
    add_reference :campaigns, :creator, foreign_key: {to_table: :users}
  end
end
