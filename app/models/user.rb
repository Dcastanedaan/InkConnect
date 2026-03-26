class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum :role, { usuario: 0, tattoo_artist: 1, admin: 2 }

  before_create :set_default_role
  has_one :tattoo_artist, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  private

  def set_default_role
    self.role ||= :usuario
  end
end
