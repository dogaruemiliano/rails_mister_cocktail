class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses

  validates :name, uniqueness: true, presence: true

  # Should it have many cocktails through doses?
  # In the challange it doesn't specify this
  # ---------------------------------------------
  # ?? Can't delete an ingredient if it is used by a cocktail
  # ---------------------------------------------
  # Do we need presence if we have uniqueness? :D
end
