class Gallery < ApplicationRecord
  belongs_to :user
  has_many_attached :entities
end
