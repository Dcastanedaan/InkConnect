class CreateTattooArtists < ActiveRecord::Migration[8.1]
  def change
    create_table :tattoo_artists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :studio_name
      t.text :bio
      t.string :location
      t.string :instagram
      t.string :website
      t.decimal :hourly_rate

      t.timestamps
    end
  end
end
