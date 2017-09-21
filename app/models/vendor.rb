class Vendor < ApplicationRecord
  # Direct associations

  has_many   :items,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
