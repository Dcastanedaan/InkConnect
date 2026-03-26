class TattooStyle < ApplicationRecord
  has_many :portfolio_styles
  has_many :portfolios, through: :portfolio_styles
end
