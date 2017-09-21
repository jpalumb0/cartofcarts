class Item < ApplicationRecord
  # Direct associations

  belongs_to :vendor

  belongs_to :user

  # Indirect associations

  # Validations

end
