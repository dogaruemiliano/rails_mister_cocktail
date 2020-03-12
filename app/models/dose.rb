class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :cocktail, presence: true
  validates :ingredient, presence: true

  validates :cocktail, uniqueness: { scope: :ingredient }

  # A dose must have a description, a cocktail and an ingredient, and [cocktail, ingredient] pairings should be unique.
  # How to do this ^^^
end
