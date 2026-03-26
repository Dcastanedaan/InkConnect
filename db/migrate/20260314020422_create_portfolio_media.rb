class CreatePortfolioMedia < ActiveRecord::Migration[8.1]
  def change
    create_table :portfolio_media do |t|
      t.references :portfolio, null: false, foreign_key: true
      t.string :media_type
      t.string :image_url
      t.string :youtube_url

      t.timestamps
    end
  end
end
