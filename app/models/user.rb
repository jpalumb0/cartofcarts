class User < ApplicationRecord
  # Direct associations

  has_many   :followeds,
             :class_name => "Follow",
             :foreign_key => "following_id",
             :dependent => :destroy

  has_many   :follows,
             :foreign_key => "follower_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
