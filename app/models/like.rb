class Like < ApplicationRecord
  belongs_to :user
  belongs_to :portfolio

  validates :user_id, uniqueness: { scope: :portfolio_id } # No duplicados
end
