class PostComment < ApplicationRecord

  belongs_to :book
  belongs_to :user
  
  has_many :notifications, dependent: :destroy

end
