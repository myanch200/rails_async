class Book < ApplicationRecord
  belongs_to :author, counter_cache: true

  scope :search, ->(search) { where("name ILIKE ?", "%#{search}%") if search.present? }
end
