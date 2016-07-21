class LedPicture < ActiveRecord::Base

  has_attached_file :image, styles: { large: "600x600!", medium: "253x450!", thumb: "100x100!" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_attached_file :gif, styles: { large: "600x600!", medium: "253x450!", thumb: "100x100!" }

end
