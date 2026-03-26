class CreateTests < ActiveRecord::Migration[8.1]
  def change
    create_table :tests do |t|
      t.string :name

      t.timestamps
    end
  end
end
