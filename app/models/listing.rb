class Listing < ActiveRecord::Base
  has_attached_file :image, styles: { large: "300x300>", medium: "200x>", thumb: "100x100>" }, default_url: "default.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

