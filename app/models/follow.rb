class Follow < ApplicationRecord
  # Direct associations

  belongs_to :following,
             :class_name => "User",
             :counter_cache => :followeds_count

  belongs_to :follower,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
