class Post < ApplicationRecord

#google maps integration
geocoded_by :location
after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }

#validating post submission
validates :title, :description, :location, presence: true

end
