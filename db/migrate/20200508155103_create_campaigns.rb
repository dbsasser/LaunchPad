class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :description
      t.string :picture
      t.integer :goal
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
