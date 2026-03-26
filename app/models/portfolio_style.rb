class PortfolioStyle < ApplicationRecord
  belongs_to :portfolio
  belongs_to :tattoo_style
  belongs_to :user
end
