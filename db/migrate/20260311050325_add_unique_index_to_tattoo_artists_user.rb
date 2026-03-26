class AddUniqueIndexToTattooArtistsUser < ActiveRecord::Migration[8.1]
  def change
    unless index_exists?(:tattoo_artists, :user_id)
      add_index :tattoo_artists, :user_id, unique: true
    end
  end
end
