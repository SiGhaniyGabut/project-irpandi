class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_rich_text :content

  validates_presence_of :title, :content
end
