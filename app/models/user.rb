class User < ApplicationRecord
  validates :username, presence: true
  validates :email, uniqueness: true

  has_and_belongs_to_many :events
end
