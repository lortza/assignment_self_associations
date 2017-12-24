class User < ApplicationRecord

  ###### Gifts #######
  # Associations for the gift_giver
  has_many :initiated_giftings, # unique alias for the join table
           :class_name => "Gifting", # identifies the table to use
           :foreign_key => :giver_id # identifies the table column to use for the giver

  has_many :recipients, # unique alias to join to the user table
           :through => :initiated_giftings, # identifies the join table to reach through
           :source => :gift_recipient # identifies the association name in the Gifting model of the object we want to retrieve


  # Associations for the gift_recipient
  has_many :received_giftings,
           :foreign_key => :recipient_id,
           :class_name => "Gifting"

  has_many :givers,
           :through => :received_giftings,
           :source => :gift_initiator


  ###### Friends #######
  # When acting as the initiator of the friending
  has_many :initiated_friendings,
           :foreign_key => :friender_id,
           :class_name => "Friending"

  has_many :friended_users,
           :through => :initiated_friendings,
           :source => :friend_recipient

  # When acting as the recipient of the friending
  has_many :received_friendings,
           :foreign_key => :friend_id,
           :class_name => "Friending"

  has_many :users_friended_by,
           :through => :received_friendings,
           :source => :friend_initiator


  # Associations for the follower
  # has_many :followings, foreign_key: :follower_id
  # has_many :followed_users, through: :followings, source: :followed_user, dependent: :destroy



  # Associations for the followee
  # has_many :followers, through: :followings
  # has_many :followees, through: :followings, class_name: :User, source: :followee
end
