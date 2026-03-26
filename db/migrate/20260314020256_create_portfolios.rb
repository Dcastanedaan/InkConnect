class CreatePortfolios < ActiveRecord::Migration[8.1]
  def change
    create_table :portfolios do |t|
      t.references :tattoo_artist, null: false, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
