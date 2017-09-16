class Post < ApplicationRecord

#google maps integration
geocoded_by :location
after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }

#paperclip gem image file upload
has_attached_file :image, styles: { large: "600x600>", medium: "400x400>", thumb: "100x100#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

#validating post submission
validates :title, :description, :location, presence: true

end
