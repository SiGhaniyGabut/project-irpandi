class Ticket < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates_presence_of :name, :price, :short_description, :description
end
