class Book < ApplicationRecord
  belongs_to :author, counter_cache: true
  has_rich_text :description
  has_one_attached :cover
  scope :search, ->(search) { where("name ILIKE ?", "%#{search}%") if search.present? }
end
