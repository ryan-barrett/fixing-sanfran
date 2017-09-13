class Post < ApplicationRecord

validates :title, :description, :location, presence: true

end
