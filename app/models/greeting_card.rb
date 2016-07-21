class GreetingCard < ActiveRecord::Base

  has_attached_file :front_image, styles: { large: "600x600!", medium: "300x300!", thumb: "100x100!" }
  validates_attachment_content_type :front_image, content_type: /\Aimage\/.*\Z/

  has_attached_file :inside_image, styles: { large: "600x600!", medium: "300x300!", thumb: "100x100!" }
  validates_attachment_content_type :inside_image, content_type: /\Aimage\/.*\Z/

end
