class Portfolio < ApplicationRecord
  belongs_to :tattoo_artist
  
  has_many :portfolio_media, dependent: :destroy
  has_many :portfolio_styles 
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :images
  validate :images_count_within_limit
  
  def liked_by?(user)
    likes.exists?(user: user)
  end

  private

  def images_count_within_limit
    if images.attached? && images.count > 10
      errors.add(:images, "no pueden ser más de 10")
    end
  end
end
