class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :role, default: 0
      t.text :bio
      t.string :avatar_url
      t.string :location

      t.timestamps
    end
  end
end
