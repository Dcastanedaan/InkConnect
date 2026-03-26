class TattooArtist < ApplicationRecord
  belongs_to :user
  has_many :portfolios, dependent: :destroy
end
