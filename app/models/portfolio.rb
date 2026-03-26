class Portfolio < ApplicationRecord
  belongs_to :tattoo_artist
  
  has_many :portfolio_media, dependent: :destroy
  has_many :portfolio_styles 
  has_many :likes, dependent: :destroy
   has_many :comments, dependent: :destroy
  has_many_attached :images

  def liked_by?(user)
    likes.exists?(user: user)
  end
end
