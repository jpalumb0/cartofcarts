class Follow < ApplicationRecord
  # Direct associations

  belongs_to :follower,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
