class Book < ApplicationRecord
  belongs_to :author, counter_cache: true
  has_rich_text :description
  has_one_attached :cover do |attachable|
    attachable.variant :lazy_loaded, resize_to_limit: [10, 10]
  end


  after_save :touch_author

  scope :search, ->(search) { where("name ILIKE ?", "%#{search}%") if search.present? }

  cached_fields = %w[name description cover ]
  def touch_author
    # if attachment or rich_text_description changed, touch author
    author.touch if saved_changes.keys.any? { |k| k.in?(cached_fields) }
  end
end
